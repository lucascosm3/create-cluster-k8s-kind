function _get_distro () {
  grep ^ID= /etc/os-release | cut -d = -f 2
} 

function _install_curl () {
  
  case "`get_distro`" in
    ubuntu) sudo apt install curl -y ;;
    fedora) sudo yum install curl -y ;;
  esac
}

function _install_kind () {
  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64 && \
  chmod +x ./kind && \
  sudo mv ./kind /usr/local/bin/kind
}

function _install_kubectl () {
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
  chmod +x ./kind && \
  sudo mv ./kind /usr/local/bin/kind
}

function _install_docker () {
  curl -fsSL https://get.docker.com -o get-docker.sh && \
  sudo sh get-docker.sh && \
  sudo systemctl enable docker && \
  sudo systemctl start docker.socket && \
  sudo systemctl start docker.service && \
  sudo usermod -a -G docker $USER && \
  echo ">> Run the command 'newgrp docker' and start the script again." && \
  exit
}