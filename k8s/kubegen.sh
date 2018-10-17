#! /bin/sh

set -ex

FRONTEND_SERVICE_YAML=frontend-service.yaml
VOTE_SERVICE_YAML=vote-service.yaml
NOTIFICATION_SERVICE_YAML=notification-service.yaml

FRONTEND_SERVICE_IMAGE=gcr.io/qingyangc-sandbox/codeone-frontend
VOTE_SERVICE_IMAGE=gcr.io/qingyangc-sandbox/codeone-vote
NOTIFICATION_SERVICE_IMAGE=gcr.io/qingyangc-sandbox/codeone-notification

# Generates the deployment for the frontend-service, exposing port 8080 (HTTP).
echo "# AUTO-GENERATED" > ${FRONTEND_SERVICE_YAML}
kubectl run frontend-service --image=${FRONTEND_SERVICE_IMAGE} --port=8080 -o yaml --dry-run >> ${FRONTEND_SERVICE_YAML}

# Generates the service for the frontend-service.
kubectl expose -f ${FRONTEND_SERVICE_YAML} --port=80 --target-port=8080 --name=frontend-service --type=ClusterIP --dry-run -o yaml >> temp
echo "---" >> ${FRONTEND_SERVICE_YAML}
cat temp >> ${FRONTEND_SERVICE_YAML}
rm temp

# Generates the deployment for the vote-service, exposing port 8081 (HTTP).
echo "# AUTO-GENERATED" > ${VOTE_SERVICE_YAML}
kubectl run vote-service --image=${VOTE_SERVICE_IMAGE} --port=8081 -o yaml --dry-run >> ${VOTE_SERVICE_YAML}

# Generates the service for the vote-service.
kubectl expose -f ${VOTE_SERVICE_YAML} --port=80 --target-port=8081 --name=vote-service --type=ClusterIP --dry-run -o yaml >> temp
echo "---" >> ${VOTE_SERVICE_YAML}
cat temp >> ${VOTE_SERVICE_YAML}
rm temp

# Generates the deployment for the notification-service, exposing port 3000 (HTTP).
echo "# AUTO-GENERATED" > ${NOTIFICATION_SERVICE_YAML}
kubectl run notification-service --image=${NOTIFICATION_SERVICE_IMAGE} --port=3000 -o yaml --dry-run >> ${NOTIFICATION_SERVICE_YAML}

# Generates the service for the notification-service.
kubectl expose -f ${NOTIFICATION_SERVICE_YAML} --port=80 --target-port=3000 --name=notification-service --type=ClusterIP --dry-run -o yaml >> temp
echo "---" >> ${NOTIFICATION_SERVICE_YAML}
cat temp >> ${NOTIFICATION_SERVICE_YAML}
rm temp
