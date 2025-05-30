FROM registry.opensuse.org/opensuse/tumbleweed:latest

RUN \
	zypper --non-interactive addrepo https://download.opensuse.org/repositories/openSUSE:/Tools/openSUSE_Tumbleweed/openSUSE:Tools.repo && \
	zypper --non-interactive --gpg-auto-import-keys refresh && \
	zypper --non-interactive install osc build hostname sudo perl-libwww-perl perl-XML-Parser diffutils unzip vim git wget && \
	groupadd --gid 399 abuild && \
	useradd --system --uid 399 --gid abuild --home-dir /home/abuild --shell /bin/bash abuild && \
	usermod -a -G trusted abuild

WORKDIR /root/.config/osc
COPY oscrc .

WORKDIR /root

ENTRYPOINT ["/bin/sleep", "infinity"]

