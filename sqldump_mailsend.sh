#!/bin/bash


export TIMESTAMP=$(date +'%Y%m%d')
mysqldump $MYSQL_DATABASE -u$MYSQL_USER -hdb -p$MYSQL_PASSWORD 2>/dev/null > /sqldb_dump/dump$TIMESTAMP.sql
#gzip -rmf /sqldb_dump/dump${TIMESTAMP}.sql > /sqldb_dump/db_dump.sql.gz
gzip -rmf /sqldb_dump/dump${TIMESTAMP}.sql
#mpack -s"" -d /sqldb_dump/db_dump.sql.gz alexandr.koptev@gmail.com
mpack -s"" -d /sqldb_dump/dump*.gz alexandr.koptev@gmail.com
#mv /sqldb_dump/db_dump.sql.gz /sqldb_dump/db_dump.sql-old.gz
mv /sqldb_dump/dump*.gz /sqldb_dump/db_dump.sql-old.gz

