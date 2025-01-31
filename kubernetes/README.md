# Usages

> kube_delete_ns.sh
- k8s Namespace 가 Terminating 상태에서 멈춰있을 때, API 를 직접 호출해서 삭제하는 코드
```bash
bash <(curl -s https://raw.githubusercontent.com/doitgrow/scripts/refs/heads/main/kubernetes/kube_delete_ns.sh) <NAMESPACE>
```