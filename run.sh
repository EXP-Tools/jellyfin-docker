#!/bin/bash
# 运行 mStream 服务
#------------------------------------------------
# 命令执行示例：
# ./run.sh -i 1000 -g 1000
#------------------------------------------------

U_ID=`id | awk -F '[(=]' '{print $2}'`
G_ID=`id | awk -F '[(=]' '{print $4}'`

set -- `getopt i:g: "$@"`
while [ -n "$1" ]
do
  case "$1" in
    -i) U_ID="$2"
        shift ;;
    -g) G_ID="$2"
        shift ;;
  esac
  shift
done

uid=${U_ID} gid=${G_ID} docker-compose up -d
