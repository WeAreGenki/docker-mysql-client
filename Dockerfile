# MySQL client image for general purpose use

FROM alpine:3.10@sha256:6a92cd1fcdc8d8cdec60f33dda4db2cb1fcdcacf3410a8e05b3741f44a9b5998
LABEL MAINTAINER="Max Milton <max@wearegenki.com>"

RUN addgroup -g 311 -S dba \
	&& adduser -D -u 311 -S -h /var/lib/mysql -s /sbin/nologin -G dba dba \
	&& mkdir -p /var/log/mariadb \
	&& apk add --no-cache mariadb-client \
	\
	&& echo 'echo -e "\
	\e[1mINSTRUCTIONS:\e[0m Run MySQL client tools as normal. Tools are in: /usr/bin\n\
	\n\e[93mExample:\e[0m\n	mysql -h examplehost.com -u root -p\n\
	"' > /var/lib/mysql/instructions.sh \
	\
	# Forward logs to docker log collector
	&& ln -sf /dev/stdout /var/log/mariadb/mariadb.log \
	&& chown -R dba /var/lib/mysql /var/log/mariadb \
	&& chmod +x /var/lib/mysql/instructions.sh \
	\
	# Unset SUID on all files
	&& for i in $(find / -perm /6000 -type f); do chmod a-s $i; done

WORKDIR /var/lib/mysql
USER dba

CMD ["/bin/sh", "-sc", "~/instructions.sh"]
