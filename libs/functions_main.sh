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