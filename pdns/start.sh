#!/usr/bin/env bash
MYSQL_HOST=${MYSQL_HOST:-db}
MYSQL_PORT=${MYSQL_PORT:-3306}
MYSQL_USER=${MYSQL_USER:-root}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-root}
MYSQL_DB=${MYSQL_DB:-hosting_panel}
PDNS_ALLOW_AXFR_IPS=${PDNS_ALLOW_AXFR_IPS:-127.0.0.1}
PDNS_MASTER=${PDNS_MASTER:-yes}
PDNS_SLAVE=${PDNS_SLAVE:-no}
PDNS_CACHE_TTL=${PDNS_CACHE_TTL:-20}
PDNS_DISTRIBUTOR_THREADS=${PDNS_DISTRIBUTOR_THREADS:-3}
PDNS_RECURSIVE_CACHE_TTL=${PDNS_RECURSIVE_CACHE_TTL:-10}

until nc -z ${MYSQL_HOST} ${MYSQL_PORT}; do
    echo "$(date) - waiting for mysql..."
    sleep 1
done

if mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} --host=${MYSQL_HOST} "${MYSQL_DB}" >/dev/null 2>&1 </dev/null
then
	echo "Database ${MYSQL_DB} already exists"
else
	echo "Database ${MYSQL_DB} does not exist. Creating..."
    mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} --host=${MYSQL_HOST} -e "CREATE DATABASE ${MYSQL_DB}"
    mysql -u ${MYSQL_USER} -p${MYSQL_PASSWORD} --host=${MYSQL_HOST} ${MYSQL_DB} < /hosting_panel.sql
fi

### PDNS
sed -i "s/{{MYSQL_HOST}}/${MYSQL_HOST}/" /etc/powerdns/pdns.d/pdns.local.gmysql.conf
sed -i "s/{{MYSQL_PORT}}/${MYSQL_PORT}/" /etc/powerdns/pdns.d/pdns.local.gmysql.conf
sed -i "s/{{MYSQL_USER}}/${MYSQL_USER}/" /etc/powerdns/pdns.d/pdns.local.gmysql.conf
sed -i "s/{{MYSQL_PASSWORD}}/${MYSQL_PASSWORD}/" /etc/powerdns/pdns.d/pdns.local.gmysql.conf
sed -i "s/{{MYSQL_DB}}/${MYSQL_DB}/" /etc/powerdns/pdns.d/pdns.local.gmysql.conf
sed -i "s/{{PDNS_ALLOW_AXFR_IPS}}/${PDNS_ALLOW_AXFR_IPS}/" /etc/powerdns/pdns.conf
sed -i "s/{{PDNS_MASTER}}/${PDNS_MASTER}/" /etc/powerdns/pdns.conf
sed -i "s/{{PDNS_SLAVE}}/${PDNS_SLAVE}/" /etc/powerdns/pdns.conf
sed -i "s/{{PDNS_CACHE_TTL}}/${PDNS_CACHE_TTL}/" /etc/powerdns/pdns.conf
sed -i "s/{{PDNS_DISTRIBUTOR_THREADS}}/${PDNS_DISTRIBUTOR_THREADS}/" /etc/powerdns/pdns.conf
sed -i "s/{{PDNS_RECURSIVE_CACHE_TTL}}/${PDNS_RECURSIVE_CACHE_TTL}/" /etc/powerdns/pdns.conf

cat /etc/powerdns/pdns.d/pdns.local.gmysql.conf

/usr/sbin/pdns_server

#exec /usr/bin/supervisord
