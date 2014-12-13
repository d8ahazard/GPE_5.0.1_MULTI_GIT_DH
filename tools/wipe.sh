#!/sbin/sh
/sbin/busybox find /data -maxdepth 1 -type d ! -path "/data" ! -path "/data/media" | xargs rm -rf
/sbin/busybox find /data -maxdepth 1 -type f ! -path "/data" ! -path "/data/media" | xargs rm -f
