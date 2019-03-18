## Project requirements

* docker
* docker-compose

#### Required wordpress plugins
 - [really-simple-ssl](https://wordpress.org/plugins/really-simple-ssl/) (v 3.1.4)
 - [simple-ldap-login](https://wordpress.org/plugins/simple-ldap-login/) (v 1.6.0)

## Docker deployment

- Install docker and docker-compose (tested on: Docker version 18.09.2, docker-compose version 1.23.1)
- Clone [repository](https://bitbucket.org/onix-systems/knowledge.onix.kr.ua).
- Rename `.env.default` to `.env` and modify the file (set actual environment variables)
- Create dir `./docker-entrypoint-initdb.d`. Put sql-dump here (example: `./docker-entrypoint-initdb.d/dump.sql`).
- Open sql dump in text redactor and find/replace `old_domain.com` to `new_domain.com`.
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
