# helm gitlab repository 추가
helm repo add gitlab https://charts.gitlab.io/

# gitlab 서버를 해당 네임스페이스에 설치
# DOMAIN_NAME = gitlab에 접근하는 도메인 네임
# EMAIL = Let's Encrypt에서 인증서를 발급할 수 있는 이메일 주소
# KUBERNETES_NAMESPACE = 
#helm install gitlab gitlab/gitlab \
#--set global.hosts.domain=$DOMAIN_NAME \
#--set certmanager-issuer.email=$EMAIL \
#--namespace $KUBERNETES_NAMESPACE

helm install -n yongckim -f piscine_values.yaml gitlab gitlab/gitlab

#helm 삭제를 하고 싶을 경우 다음 명령 입력
# helm uninstall gitlab