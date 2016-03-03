# docker-mysql-s3-backups
Schedule mysql backups and store them in S3. It uses s3cmd to upload the backups to S3.

# docker-compose.yml.sample

docker-compose.yml sample file, it contains the ENV variables necessaries to config the backups and store it in S3.

```
db:
  image: mysql
  environment:
    MYSQL_ROOT_PASSWORD: "password"
    MYSQL_DATABASE: "database"
    MYSQL_USER: "user" #this user has permissions for the database specified by the MYSQL_DATABASE variable
    MYSQL_PASSWORD: "userpassword"

dbbackup:
  build: .
  environment:
    AWS_ACCESS_KEY: "aws_access_key"
    AWS_SECRET_KEY: "aws_secret_key"
    BUCKET: bucket
    APPNAME: appname
  links:
    - db
```
