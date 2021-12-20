FROM ubuntu:latest

# 필요한 의존성 파일 설치 및 구성
RUN	apt-get update

RUN	apt-get install -y	curl
RUN DEBIAN_FRONTEND=noninteractive TZ=Asia/Seoul apt-get -y install openssh-server \
						ca-certificates \
						tzdata \
						perl

# postfix 설치 
RUN echo "postfix postfix/main_mailer_type    select  Internet Site \
		postfix postfix/mailname    string  example.com" | debconf-set-selections && \
	DEBIAN_FRONTEND=noninteractive apt-get install -y postfix

# GitLab 패키지 저장소 추가 및 패키지 설치
RUN	curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | bash

# gitlab enterprise 설치
RUN EXTERNAL_URL="https://gitlab.example.com" apt-get install gitlab-ee

ENTRYPOINT ["bash"]