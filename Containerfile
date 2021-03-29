FROM registry.access.redhat.com/ubi8/ubi

MAINTAINER Ishan Singhal <isinghal@redhat.com>

VOLUME /hosts_dir

RUN INSTALL_PKGS="dnsmasq" \
  && yum -y install $INSTALL_PKGS \
  && yum clean all

EXPOSE 53/tcp 53/udp

CMD ["/usr/sbin/dnsmasq", "-d", "--hostsdir=/hosts_dir"]