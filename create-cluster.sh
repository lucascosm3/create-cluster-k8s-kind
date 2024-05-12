#!/usr/bin/env bash
#
# nome_do_script.sh - Breve descrição
#
#
# ------------------------------------------------------------------------ #
#  Descrição
#
#  Exemplos:
#      $ ./nomedoscript.sh -d 1
# ------------------------------------------------------------------------ #
# Testado em:
#   bash x.y.zz
# ------------------------------------------------------------------------ #

source libs/functions_deps.sh
source libs/functions_main.sh

# ------------------------------- VARIÁVEIS ----------------------------------------- #
CLUSTER_NAME="demo"
ENABLE_INGRESS=1
ENABLE_METALLB=1
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ -z "`which curl`" ] && sudo apt _install_curl -y
[ -z "`which curl`" ] && sudo apt _install_kind -y
[ -z "`which curl`" ] && sudo apt _install_kubectl -y
[ -z "`which curl`" ] && sudo apt _install_docker -y
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
while [ -n "$1" ]; do
  case "$1" in
    --cluster-name) shift; CLUSTER_NAME="$1" ;;
    --no-ingress) ENABLE_INGRESS=0           ;;
    --no-metallb) ENABLE_INGRESS=0           ;;
  esac
  shift
done

_create_cluster
# ------------------------------------------------------------------------------------- #

