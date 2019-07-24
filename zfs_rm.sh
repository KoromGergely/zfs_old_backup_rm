#!/bin/bash

ZFS_LIST=($( zfs list -r backup2 | awk '{ print $1 }' | tail -n +3 | grep -v "iscsi" ))


DATE=$(date --date='-4 month' +"%Y-%m")
for zfs in ${ZFS_LIST[@]}; do
  echo $zfs
  zfs list -r backup2 -t snapshot -o name,creation $zfs | awk '{ print "zfs destroy  "$1 }' | tail -n +3 | grep $DATE | bash
done

DATE=$(date --date='-3 month' +"%Y-%m")
for zfs in ${ZFS_LIST[@]}; do
  echo $zfs
  zfs list -r backup2 -t snapshot -o name,creation $zfs | awk '{ print "zfs destroy  "$1 }' | tail -n +3 | grep $DATE | bash
done

DATE=$(date --date='-2 month' +"%Y-%m")
for zfs in ${ZFS_LIST[@]}; do
  echo $zfs
  zfs list -r backup2 -t snapshot -o name,creation $zfs | awk '{ print "zfs destroy  "$1 }' | tail -n +3 | grep $DATE | bash
done


DATE=$(date --date='-1 month' +"%Y-%m")
for zfs in ${ZFS_LIST[@]}; do
  echo $zfs
  zfs list -r backup2 -t snapshot -o name,creation $zfs | awk '{ print "zfs destroy  "$1 }' | tail -n +3 | grep $DATE | grep -v "\-01\-" | grep -v "\-15\-" | ba
sh
done


