
all: sync-operator sync-repo-config

sync-operator:
	gsutil cp gs://config-management-release/released/latest/config-sync-operator.yaml config-sync-operator.yml
	kubectl apply -f config-sync-operator.yml
	rm config-sync-operator.yml

sync-operator-status:
	kubectl -n kube-system get pods -l k8s-app=config-management-operator

sync-repo-config:
	kubectl apply -f config.yml

sync-status:
	kubectl get all -n config-management-system

clean:
	kubectl delete -f config.yml