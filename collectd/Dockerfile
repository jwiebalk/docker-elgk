FROM debian:wheezy
MAINTAINER jwiebalk

ENV collectd_ver 5.4.1
ENV basedir /opt/collectd

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends build-essential libcurl4-openssl-dev librrd2-dev curl && \
	cd /opt && \
  	curl http://collectd.org/files/collectd-${collectd_ver}.tar.gz | tar zx && \
  	cd collectd-${collectd_ver} && \
  	./configure --prefix=${basedir} && \
  	make && \
  	make install && \
  	rm -rf /opt/collectd-${collectd_ver} && \
  	apt-get remove --purge -y build-essential && \
  	apt-get clean && \
  	rm -rf /var/lib/apt/lists/*


ADD collectd.conf ${basedir}/etc/collectd.conf
ADD collectd.d ${basedir}/etc/collectd.d
ADD entrypoint.sh /collectd_entrypoint.sh
RUN chmod a+x /collectd_entrypoint.sh
RUN mkdir ${basedir}/var/lib/collectd/rrd

CMD /collectd_entrypoint.sh
