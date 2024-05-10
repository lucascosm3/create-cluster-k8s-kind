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

# ------------------------------- VARIÁVEIS ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
function get_distro () {
  grep ^ID= /etc/os-release | cut -d = -f 2
} 

function install_curl () {
  
  case "`get_distro`" in
    ubuntu) sudo apt install curl -y ;;
    fedora) sudo yum install curl -y ;;
  esac
}

function install_kind () {
  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64 && \
  chmod +x ./kind && \
  sudo mv ./kind /usr/local/bin/kind
}
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ -z "`which curl`" ] && sudo apt install_curl -y
[ -z "`which curl`" ] && sudo apt install_kind -y
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #