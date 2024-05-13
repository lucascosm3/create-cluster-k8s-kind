function _get_distro () {
  source /etc/os-release
  echo $ID
} 

function _install_curl () {
  case "`_get_distro`" in
    ubuntu) sudo apt install curl -y ;;
    fedora) sudo dnf install curl -y ;;  # Changed to dnf for Fedora
  esac
}

function _install_kind () {
  echo "Installing Kind..."
  curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.22.0/kind-linux-amd64 && \
  chmod +x ./kind && \
  sudo mv ./kind /usr/local/bin/kind
}

function _install_kubectl () {
  echo "Installing kubectl..."
  curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
  chmod +x ./kubectl && \
  sudo mv ./kubectl /usr/local/bin/kubectl
}

function _install_docker () {
  echo "Installing Docker..."
  curl -fsSL https://get.docker.com -o get-docker.sh && \
  sudo sh get-docker.sh && \
  sudo systemctl enable docker && \
  sudo systemctl start docker.socket && \
  sudo systemctl start docker.service && \
  sudo usermod -aG docker $USER && \
  echo ">> Docker installed successfully. Please log out and log back in if necessary."
}

}
