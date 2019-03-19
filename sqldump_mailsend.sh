#!/bin/bash

export destmail=alexandr.koptev@gmail.com
export TIMESTAMP=$(date +'%Y%m%d')
mysqldump $MYSQL_DATABASE -u$MYSQL_USER -hdb -p$MYSQL_PASSWORD 2>/dev/null > /sqldb_dump/dump$TIMESTAMP.sql
gzip -rmf /sqldb_dump/dump${TIMESTAMP}.sql
mpack -s"" -d /sqldb_dump/dump${TIMESTAMP}.sql.gz $destmail
mv /sqldb_dump/dump*.gz /sqldb_dump/db_dump.sql-old.gz
tar zcvf /sqldb_dump/wp-content${TIMESTAMP}.tar /wp-content
sleep 60
mpack -s"" -d /sqldb_dump/wp-content${TIMESTAMP}.tar $destmail
sleep 5
mv /sqldb_dump/wp-content${TIMESTAMP}.tar /sqldb_dump/wp-content-old.tar

