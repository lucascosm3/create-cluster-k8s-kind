#!/usr/bin/env bash
#
# create-cluster.sh - Create a Kubernetes cluster with Kind and extensions
#
# Author: Lucas Cosme
# ------------------------------------------------------------------------ #
# Description:
#  Creates a Kubernetes cluster using Kind with optional NGINX Ingress and MetalLB
#
# Usage:
#  ./create-cluster.sh --no-ingress --no-metallb --cluster-name demo
# ------------------------------------------------------------------------ #
# Tested on:
#   bash 5.1.16
# ------------------------------------------------------------------------ #

echo "Starting installation of dependencies..."
source libs/functions_deps.sh
_install_docker
_install_kind
_install_kubectl
echo "Dependencies installed."
source libs/functions_main.sh

# ------------------------------- VARIABLES ----------------------------------------- #
CLUSTER_NAME="demo"
ENABLE_INGRESS=1
ENABLE_METALLB=1
# ------------------------------------------------------------------------ #

# ------------------------------- FUNCTIONS ----------------------------------------- #
function trapped () {
  echo "Error on line $1."
  echo "Debug: Last command to run was $(BASH_COMMAND)"
  _clean
  exit 1
}

trap 'trapped $LINENO' ERR
echo "Running kind create cluster"
_create_cluster
echo "Kind cluster created successfully"
# ------------------------------- TESTS ----------------------------------------- #
[ -z "`which curl`" ] && _install_curl
[ -z "`which kind`" ] && _install_kind
[ -z "`which kubectl`" ] && _install_kubectl
[ -z "`which docker`" ] && _install_docker
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUTION ----------------------------------------- #
while [ -n "$1" ]; do
  case "$1" in
    --cluster-name) shift; CLUSTER_NAME="$1" ;;
    --no-ingress) ENABLE_INGRESS=0 ;;
    --no-metallb) ENABLE_METALLB=0 ;;
    -h|--help) _help; exit ;;
    *) _error "$1" ;;
  esac
  shift
done

# ------------------------------------------------------------------------------------- #
