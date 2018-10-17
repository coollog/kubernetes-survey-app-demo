frontend-service

/ - take the survey
/results.html - survey results page

vote-service

/ - send vote data to this, publishes to notification-service

notification-service

subscribe to vote notifications


```
kubectl create clusterrolebinding my-cluster-admin-binding --clusterrole=cluster-admin --user=$(gcloud info --format="value(config.account)")
export EXTERNAL_IP=???
./apply_ambassador.sh
./skaffold dev
```
