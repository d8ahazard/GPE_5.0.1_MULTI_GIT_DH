#!/sbin/sh

for i in $(/system/xbin/busybox --list); do
  busybox ln -sf busybox "/system/xbin/$i"
done