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

function install_kubectl () {
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
  chmod +x ./kind && \
  sudo mv ./kind /usr/local/bin/kind
}

function install_docker () {
  curl -fsSL https://get.docker.com -o get-docker.sh && \
  sudo sh get-docker.sh && \
  sudo systemctl enable docker && \
  sudo systemctl start docker.socket && \
  sudo systemctl start docker.service && \
  sudo usermod -a -G docker $USER
}
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ -z "`which curl`" ] && sudo apt install_curl -y
[ -z "`which curl`" ] && sudo apt install_kind -y
[ -z "`which curl`" ] && sudo apt install_kubectl -y
[ -z "`which curl`" ] && sudo apt install_docker -y
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #