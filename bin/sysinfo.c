/*
Small wrapper around the sysinfo(2) syscall.

Compile with `cc -Wall -Wextra -pedantic -o sysinfo sysinfo.c`  
*/


#ifdef __linux__
	#include <sys/sysinfo.h>
#elif __APPLE__
	#include <sys/param.h>
	#include <sys/types.h>
	#include <sys/sysctl.h>
	#include <time.h>
	#include <math.h>
	#include <stdlib.h>
#else
	#error "Platform not supported"
#endif

#include <stdio.h>

#ifdef __APPLE__
static void sbn_or_die(const char *name, void* val, size_t size) {
	int r;
	size_t t = size;
	/* see 'man 3 sysctl' for details */
	r = sysctlbyname(name, val, &t, NULL, 0);
	if (r != 0) {
		exit(1);
	}
}
static void nprocs_or_die(size_t *nprocs) {
	int r;
	int mib[4];
	size_t bufsize = 0;
	mib[0] = CTL_KERN;
	mib[1] = KERN_PROC;
	mib[2] = KERN_PROC_ALL;
	mib[3] = 0;
	r = sysctl(mib, 4, NULL, &bufsize, NULL, 0);
	if (r != 0) {
		exit(1);
	}
	*nprocs = bufsize / sizeof(struct kinfo_proc);
}
#endif

int main(int, char**) {
	int r = 0;
#ifdef __linux__
	
	struct sysinfo info;

	r = sysinfo(&info);
	if (r == 0) {
		float f = 1.f / (1 << SI_LOAD_SHIFT);
		printf("%li %.2f %.2f %.2f %hu %lu %lu %lu %lu %lu %lu %u\n",
			info.uptime,            /* in seconds */
			info.loads[0] * f,      /* 1 minute load average */
			info.loads[1] * f,      /* 5 minute load average */
			info.loads[2] * f,      /* 15 minute load average */
			info.procs,             /* number of threads */
			info.totalram,
			info.freeram,
			info.sharedram,
			info.bufferram,
			info.totalswap,
			info.freeswap,
			info.mem_unit           /* in bytes */);
	}
	else {
		printf("?\n");
	}

#elif __APPLE__

	struct timeval tv;
	struct loadavg la;
	size_t nprocs;
	int64_t mem;
	struct xsw_usage swap;
	float f = 1.f / FSCALE;
	time_t t1, t2;
	
	sbn_or_die("kern.boottime", &tv, sizeof(tv));
	t1 = tv.tv_sec;
	t2 = time(NULL);
	sbn_or_die("vm.loadavg", &la, sizeof(la));
	sbn_or_die("hw.memsize", &mem, sizeof(mem));
	nprocs_or_die(&nprocs);
	sbn_or_die("vm.swapusage", &swap, sizeof(swap));
	printf("%li %.2f %.2f %.2f %zu %lld 0 0 0 %llu %llu 1\n",
		(long)fabs(floor(difftime(t1, t2))),
		la.ldavg[0] * f,
		la.ldavg[1] * f,
		la.ldavg[2] * f,
		nprocs,
		mem,
		swap.xsu_total,
		swap.xsu_avail);

#else
	#error "Platform not supported"
#endif

	return r;
} // main

