function _create_cluster () {
  kind create cluster \
    --config config/config.yaml \
    --name "$CLUSTER_NAME"

  [ $ENABLE_INGRESS -eq 1 ] && _deploy_ingress
  [ $ENABLE_METALLB -eq 1 ] && _deploy_metallb
}

function _deploy_ingress () {
  kubectl apply -f config/nginx/ingress.yaml
}

function _deploy_metallb () {
  kubectl apply -f config/metallb/metallb.yaml
}

function _help () {
  echo "
$ ./create-cluster.sh [parameters]

Accepted parameters:
  --no-ingress - Will not deploy NGINX Ingress
  --no-metallb - Will not deploy Metal LB
  --cluster-name <name> - Tells what the name of the created cluster will be
  -h | --help - Help menu
  "
}

function _error () {
  echo "Parameter $1 does not exist."
  _help
  exit 1
}

function _clean () {
  rm -f get-docker.sh
}