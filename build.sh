#!/bin/bash

echo "1. 도커 빌드 & run"
echo "2. 도커 이미지 삭제"
echo -n "입력해주세요 : "
read

if [[ $REPLY -eq 1 ]] ; then
	docker build -t git .
	docker run -it --name git-server git
elif [[ $REPLY -eq 2 ]] ; then
	docker rm git-server
	docker rmi git
else
	echo "잘못된 입력입니다."
fi