## ===========================================================
## Golang-Piscine Makefile v0.1
## ===========================================================

############################################
#				Variables				   #
############################################
## Makefile Variables
## 

## NAME	도커 컨테이너 이름 
## 
NAME=piscine-golang-git

## UID	dockerhub id
## 
UID=zxcv9203

## Release	image의 큰 변화가 발생
## 
Release=0

## Major	주요기능의 추가나 변경 등 사용상 혹은 컨텐츠의 주요 변화가 발생
## 
Major=0

## Minor	버그 수정등 미미한 변화
## 
Minor=0

## ZERO	버전 초기화용 변수
## 

ZERO=0
## Image	dockerhub에 올라가는 이미지 이름 ($UID/$NAME)
## 
IMAGE	=	$(UID)/$(NAME)

## TAG	이미지의 버전 ($Release.$Major.$Minor)
TAG		=	$(Release).$(Major).$(Minor)

## ==========================================================

############################################
#				Text Color		           #
############################################
GRAY	=	\e[1;30m
RED		=	\e[1;31m
GREEN	=	\e[1;32m
YELLOW	=	\e[1;33m
PINK	=	\e[1;35m
CYAN	=	\e[1;34m
WHITE	=	\e[1;37m
END		=	\e[0m

############################################
#				Rules		               #
############################################
## Makefile Rules
## 

## help	Golang-Piscine 자동화 메이크 파일의 기능을 설명합니다.
## 
help:	
			@sed -n '/@sed/!s/## //p' Makefile

## build	도커 이미지를 build 합니다. build시 Minor 버전이 1 증가합니다.(빌드 후 적용됨)
## 
build:		minor	
			@echo "$(WHITE)🛠️  Docker image \"$(IMAGE):$(TAG)\" building...$(END)"
			# docker build -t $(IMAGE):$(TAG) .
			@echo "$(GREEN)✔️  Docker image \"$(IMAGE):$(TAG)\" building success!$(END)"

## push	생성한 도커 이미지를 도커허브에 저장합니다.
## 
push:	
			@echo "$(WHITE)📤 Docker image \"$(IMAGE):$(TAG)\" Pushing...$(END)"
			# docker push $(IMAGE):$(TAG)
			@echo "$(GREEN)✔️  Docker image \"$(IMAGE):$(TAG)\" Push success!$(END)"

## pull	도커허브에 올라와 있는 이미지를 로컬로 가져옵니다.
## 
pull:	
			@echo "$(WHITE)📥 Docker image \"$(IMAGE):$(TAG)\" pulling...$(END)"
			# docker pull $(IMAGE):$(TAG)
			@echo "$(GREEN)✔️  Docker image \"$(IMAGE):$(TAG)\" pull Sucess!$(END)"
## run	생성한 이미지를 NAME의 이름으로 컨테이너를 실행시킵니다.
## 
run:
			@echo "$(WHITE)🏃 Docker image \"$(IMAGE)\" starting...$(END)"
			# docker run -it --name $(NAME) $(IMAGE)
			@echo "$(GREEN)✔️  $(NAME) running!"

## minor	Minor(버전)의 값을 1증가 시킵니다.
## 
minor:
			@sed -i 's/Minor=0/Minor=$(shell expr $(Minor) + 1)/g' Makefile
## major	major(버전)의 값을 1증가 시킵니다. 하위 버전은 0으로 변경됩니다.
## 
major:
			@sed -i 's/Major=0/Major=$(shell expr $(Major) + 1)/g' Makefile
			@sed -i 's/Minor=0/Minor=$(ZERO)/g' Makefile
## release	release(버전)의 값을 1증가 시킵니다. 하위 버전은 0으로 변경됩니다.
## 
release:
			@sed -i 's/Release=0/Release=$(shell expr $(Release) + 1)/g' Makefile
			@sed -i 's/Major=0/Major=$(ZERO)/g' Makefile
			@sed -i 's/Minor=0/Minor=$(ZERO)/g' Makefile
## deploy	Docker image를 build하고 바로 push합니다.
## 
deploy:	build push
## check	현재 image의 버전을 출력합니다.
check:
	@echo "$(WHITE)현재 $(NAME) image의 버전$(END) "
	@echo "➡️ $(YELLOW)$(TAG)$(END)"
## ==========================================================

.PHONY:	help pull build run push deploy minor major release