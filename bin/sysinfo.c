/*
Small wrapper around the sysinfo(2) syscall.

Compile with `cc -Wall -Wextra -pedantic -o sysinfo sysinfo.c`  
*/

#include <sys/sysinfo.h>
#include <stdio.h>

int main(int, char**) {
	int r;
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
	return r;
}

