#/bin/bash
CURRENT_USER=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`
echo "boxen_user=${CURRENT_USER}"