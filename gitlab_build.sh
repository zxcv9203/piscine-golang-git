# docker gitlab 데이터를 저장할 외부와 볼륨 연결
export GITLAB_HOME=/srv/gitlab/

# gitlab 컨테이너 실행 (백그라운드 실행)
sudo docker run --detach \                                                    
  --hostname gitlab.example.com \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ee:latest

# 작동후 http://localhost 접속

# 접속후 ID = root 
#PW = sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
#으로 가져오는 비밀번호 입력하기