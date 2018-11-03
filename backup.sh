#!/bin/bash

if [ $ARCHIVE = YES ]; then
  now=$(date +"%s_%Y-%m-%d")
  filename=${now}_backup.tar.gz

  tar czf ${filename} ${DATA_DIRECTORY} && \
  supload -u ${SELECTEL_USER} -k ${SELECTEL_PASSWORD} ${SELECTEL_DEST} ${filename}
  rm -f ${filename}
else
  supload -u ${SELECTEL_USER} -k ${SELECTEL_PASSWORD} -r ${SELECTEL_DEST} ${DATA_DIRECTORY}
fi


res=$?

if [ -z $MAIL_DISABLED ] || [ $MAIL_DISABLED != YES ]; then
  if [ $res -ne 0 ]; then
    /send_mail.sh "Backup failure" "Backup failed" "$MAIL_FROM" "$MAIL_RECIPIENT"
  else
    if [ $MAIL_SUCCESS == YES ]; then
      /send_mail.sh "Backup" "Backup completed successfully" "$MAIL_FROM" "$MAIL_RECIPIENT"
    fi
  fi
fi
