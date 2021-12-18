## ===========================================================
## Golang-Piscine 자동화 메이크 파일 v0.1
## ===========================================================
## 변수 목록
## NAME:	도커 컨테이너 이름
## IMAGE:	도커 이미지 이름
## TAG:	도커 이미지 버전
## ==========================================================

############################################
#				Variables				   #
############################################
NAME	=	piscine-golang-git

UID		=	zxcv9203

IMAGE	=	$(UID)/$(NAME)

TAG		=	$(Release).$(Major).$(Minor)

############################################
#				Text Color		           #
############################################
GRAY	=	\e[1;30m
RED		=	\e[1;31m
GREEN	=	\e[1;32m
YELLOW	=	\e[1;33m
PINK	=	\e[1;35m
CYAN	=	\e[1;36m
WHITE	=	\e[1;37m
END		=	\e[0m

############################################
#				Rules		               #
############################################
## Makefile Rules
help:	## Golang-Piscine 자동화 메이크 파일의 기능을 설명합니다.
			@sed -ne '/@sed/!s/## //p' Makefile

build:	## 도커 이미지를 build 합니다. build 할때마다 버전이 자동으로 증가합니다.
			@echo "$(WHITE)🛠️  Docker image \"$(IMAGE):$(TAG)\" building...$(END)"
			@awk '{ print }' .env
			# docker build -t $(IMAGE):$(TAG) .
			@echo "$(GREEN)✔️  Docker image \"$(IMAGE):$(TAG)\" building success!$(END)"

push:	## 생성한 도커 이미지를 도커허브에 저장합니다.
			@echo "$(WHITE)📤 Docker image \"$(IMAGE):$(TAG)\" Pushing...$(END)"
			# docker push $(IMAGE):$(TAG)
			@echo "$(GREEN)✔️  Docker image \"$(IMAGE):$(TAG)\" Push success!$(END)"

pull:	## 도커허브에 올라와 있는 이미지를 로컬로 가져옵니다.
			@echo "$(WHITE)📥 Docker image \"$(IMAGE):$(TAG)\" pulling...$(END)"
			# docker pull $(IMAGE):$(TAG)
			@echo "$(GREEN)✔️  Docker image \"$(IMAGE):$(TAG)\" pull Sucess!$(END)"

run:	## 생성한 이미지를 NAME의 이름으로 컨테이너를 실행시킵니다.
			@echo "$(WHITE)🏃 Docker image \"$(IMAGE)\" starting...$(END)"
			# docker run -it --name $(NAME) $(IMAGE)
			@echo "$(GREEN)✔️  $(NAME) running!"

## upload: Docker image를 build하고 바로 push합니다.
upload:	build push
## ==========================================================
.PHONY:	help pull build run push upload