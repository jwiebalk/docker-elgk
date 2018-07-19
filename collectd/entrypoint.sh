#!/bin/bash
set -eo pipefail


sleep 5

sed -i "s/{{HOSTNAME}}/$HOSTNAME/g" $basedir/etc/collectd.conf
sed -i "s:{{basedir}}:$basedir:g" $basedir/etc/collectd.conf

exec $basedir/sbin/collectd -f
