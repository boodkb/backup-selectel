A small docker image to backup a directory to Selectel cloud storage


### Environment

* SCHEDULE : cron job string (ex. * * */5 * *)

* SELECTEL_USER: Username to connect to Selectel cloud storage.
* SELECTEL_PASSWORD: Password to connect to Selectel cloud storage.
* SELECTEL_DEST: Destination directory or container name in Selectel cloud storage.

* ARCHIVE: (YES or NO) Pack the data to 'tar.gz' archive before uploading

* MAIL_DISABLED: Disable email notifications. If set to "YES", all other mail parameters are ignored.
* MAIL_SERVER: Mail server (ex. smtp.yandex.ru:465)
* MAIL_USER: Mail user (ex. "alert@yandex.ru")
* MAIL_PASS: Mail password
* MAIL_USE_TLS: (YES or NO) Use TLS.
* MAIL_FROM: Notification sender name
* MAIL_RECIPIENT: Email for notifications
* MAIL_SUCCESS: (YES or NO) Send "success" notifications.


### Usage example

You should mount a docker volume or a local directory to container's '/data' directory.
Contents of this directory will be uploaded to the storage.

In docker-compose.yml:

```
version: '2'
services:
  backup:
    image: boodkb/backup-selectel
    volumes:
      - "/etc/localtime:/etc/localtime:ro"
      - "/home/user/data:/data:ro"
    environment:
      SCHEDULE: "*/5 * * * *"

      SELECTEL_USER: selectel_user
      SELECTEL_PASSWORD: selectel_password
      SELECTEL_DEST: container_name

      ARCHIVE: "YES"

      MAIL_SERVER: smtp.yandex.ru:465
      MAIL_USER: "alert@yandex.ru"
      MAIL_PASS: mail_password
      MAIL_USE_TLS: "YES"
      MAIL_FROM: "sender name"
      MAIL_RECIPIENT: recipient@gmail.com
      MAIL_SUCCESS: "YES"
      # MAIL_DISABLED: "NO"
```

