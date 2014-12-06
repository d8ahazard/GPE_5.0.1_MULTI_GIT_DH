#!/sbin/sh
/sbin/busybox find /data -maxdepth 1 -type d ! -path "/data" ! -path "/data/media" | xargs rm -rf