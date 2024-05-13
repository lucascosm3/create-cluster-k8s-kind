#!/usr/bin/env bash
#
# create-cluster.sh - Create a Kubernetes cluster with Kind and extensions
#
# Autor: Lucas Cosme
# ------------------------------------------------------------------------ #
#  Description
#
#  Examples:
#      $ ./create-cluster.sh --no-ingress --no-metallb --cluster-name demo
# ------------------------------------------------------------------------ #
# Tested on::
#   bash 5.1.16
# ------------------------------------------------------------------------ #

source libs/functions_deps.sh
source libs/functions_main.sh

# ------------------------------- VARIABLES ----------------------------------------- #
CLUSTER_NAME="demo"
ENABLE_INGRESS=1
ENABLE_METALLB=1
# ------------------------------------------------------------------------ #

# ------------------------------- FUNCTIONS ----------------------------------------- #
function trapped () {
  echo "Error on line $1."
  _clean
  exit 1
}

trap 'trapped $LINENO' ERR
# ------------------------------- TESTES ----------------------------------------- #
[ -z "`which curl`" ] && sudo apt _install_curl -y
[ -z "`which curl`" ] && sudo apt _install_kind -y
[ -z "`which curl`" ] && sudo apt _install_kubectl -y
[ -z "`which curl`" ] && sudo apt _install_docker -y
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUTION ----------------------------------------- #
while [ -n "$1" ]; do
  case "$1" in
    --cluster-name) shift; CLUSTER_NAME="$1" ;;
    --no-ingress)     ENABLE_INGRESS=0           ;;
    --no-metallb)     ENABLE_INGRESS=0           ;;
    -h|--help)        _help; exit                ;;
    *)                _error "$1"                     ;;
  esac
  shift
done

_create_cluster
# ------------------------------------------------------------------------------------- #

