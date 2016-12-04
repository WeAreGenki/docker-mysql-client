# MySQL Client Tools Docker Image

[![](https://images.microbadger.com/badges/image/wearegenki/mysql-client.svg)](https://microbadger.com/images/wearegenki/mysql-client "Get your own image badge on microbadger.com") [![GitHub Tag](https://img.shields.io/github/tag/wearegenki/docker-mysql-client.svg)](https://registry.hub.docker.com/u/wearegenki/mysql-client/)

Minimal MySQL compatible client tools docker image using MariaDB client libraries running on an Alpine Linux base. Useful for creating database dump backups or as a throw away but full-featured MySQL client.

## Usage

From a terminal you can run something like:

```
$ docker run -ti --name mysql-client wearegenki/mysql-client:latest \
    mysql -h 123.123.123.123 -u root -p
```

### Available tools

* myisam_ftdump
* mysql
* mysql_find_rows
* mysql_fix_extensions
* mysql_waitpid
* mysqlaccess
* mysqladmin
* mysqlbug
* mysqlcheck
* mysqldump
* mysqldumpslow
* mysqlimport
* mysqlshow

## Licence

ISC. See [LICENCE.md](https://github.com/WeAreGenki/docker-mysql-client/blob/master/LICENCE.md).

## Author

Proudly made by Max Milton &lt;<max@wearegenki.com>&gt;.

&copy; We Are Genki
