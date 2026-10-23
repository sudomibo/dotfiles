FROM registry.opensuse.org/opensuse/tumbleweed:latest

RUN \
	zypper --non-interactive refresh && \
	zypper --non-interactive install osc obs-service-tar_scm obs-service-download_files obs-service-recompress obs-service-format_spec_file obs-service-set_version python3 build hostname sudo perl-libwww-perl perl-XML-Parser diffutils unzip vim vim-data git wget && \
	groupadd --gid 399 abuild && \
	useradd --system --uid 399 --gid abuild --home-dir /home/abuild --shell /bin/bash abuild && \
	usermod -a -G trusted abuild && \
	cd /root && \
	rm -rf /root/bin && \
	git clone https://github.com/sudomibo/dotfiles.git && \
	mkdir -p /root/.config/osc && \
	ln /root/dotfiles/.config/osc/oscrc /root/.config/osc/oscrc && \
	mkdir -p /root/.vim && \
	ln /root/dotfiles/.vimrc && \
	ln /root/dotfiles/.bash_aliases && \
	ln /root/dotfiles/.bash_profile && \
	ln /root/dotfiles/.bashrc && \
	ln /root/dotfiles/.bash_logout && \
	ln /root/dotfiles/.profile && \
	ln -s /root/dotfiles/bin && \
	git clone https://github.com/sudomibo/rpmlint.git && \
	cd /root/rpmlint && \
	git checkout opensuse && \
	cd /root

WORKDIR /root

ENTRYPOINT ["/bin/sleep", "infinity"]

