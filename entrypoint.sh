#!/usr/bin/env bash
set -eo pipefail

drupal_root=${DRUPAL_ROOT:-docroot}
timer=${TIMER:-10}
paths=$(find /tokaido/site/"${drupal_root}" -name settings.php -a -print0 | xargs -0 dirname | tr '\n' ' ')

echo "Kishu will now maintain read/write permissions on the following paths:"
echo "$paths" | tr ' ' '\n'
while :
do
    chmod -R ug+rw ${paths} 
    sleep ${timer}
done