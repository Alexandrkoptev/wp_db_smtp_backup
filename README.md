## Project requirements

* docker
* docker-compose

#### Required wordpress plugins
 - [really-simple-ssl](https://wordpress.org/plugins/really-simple-ssl/) (v 3.1.4)
 - [simple-ldap-login](https://wordpress.org/plugins/simple-ldap-login/) (v 1.6.0)
 - [easy wp smtp](https://wordpress.org/plugins/easy-wp-smtp/) (v 1.3.9.1)
 - [authenticator](https://wordpress.org/plugins/authenticator/) (v 1.3.0)
 - [ga google analytics](https://wordpress.org/plugins/ga-google-analytics/) (v 20190311)
 - [helpguru knowledge base](shared on wplocker.com) (V 3.0.0)
 - [theme authenticity checker (TAC)](https://wordpress.org/plugins/tac/) (V 1.5.3)
## Docker deployment

- Install docker and docker-compose (tested on: Docker version 18.09.2, docker-compose version 1.23.1)
- Clone [repository](https://bitbucket.org/onix-systems/knowledge.onix.kr.ua).
- Rename `.env.default` to `.env` and modify the file (set actual environment variables)
- Create dir `./docker-entrypoint-initdb.d`. Put sql-dump here (example: `./docker-entrypoint-initdb.d/dump.sql`).
- Open sql dump in text redactor and find/replace `old_domain.com` to `new_domain.com`.
- Replace value export destmail in file sqldump_mailsend.sh_example and rename this file to sqldump_mailsend.sh
- Run chmod +x sqldump_mailsend.sh
- Replace value MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD destmail in file crontab_example and rename this file to crontab
- Replace value root=backup@example.kr.ua hostname=example.kr.ua in file ssmtp.conf_example and rename this file to ssmtp.conf
- Run bash command to run containers (in root of project).
```bash
docker-compose up -d --build
```
- Install wordpress and plugin after start container.
```bash
docker-compose exec knowledge.onix.kr.ua bash
# Enter string
wp --allow-root core install --url=knowledge.onix.kr.ua --title=knowledge --admin_user=EXAMPLE --admin_password=EXAMPLE --admin_email=EXAMPLE@onix-systems.com
# and press enter

```
- Install and and activate required plugins
```
Run your brouser (with your credentials) http://knowledge.onix.kr.ua/wp-admin/plugins.php or https://knowledge.onix.kr.ua/wp-admin/plugins.php  and activate required plugins
```
- Backup your mysql db and dir wp-content 
```
Backup your mysql db and dir wp-content start automatically every week in wed, and copy to dir sqldb_dump. Your receve mail wich backups file every week too.
```

