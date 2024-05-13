
# create-cluster-k8s-kind

Este projeto automatiza a criação de um cluster Kubernetes local usando o Kind (Kubernetes in Docker), ideal para desenvolvimento e testes de aplicações Kubernetes.

## Pré-requisitos

Para utilizar este projeto, certifique-se de que seu sistema operacional seja compatível (Ubuntu, Fedora). As dependências como Docker, Kind e kubectl são instaladas automaticamente pelos scripts se não estiverem presentes.

## Instalação e Configuração

O script `functions_deps.sh` dentro da pasta `libs` é responsável por verificar a distribuição do sistema operacional e instalar as seguintes dependências conforme necessário:

- **Docker**: Essencial para rodar contêineres.
- **Kind**: Ferramenta que permite rodar clusters Kubernetes usando Docker como nodes.
- **kubectl**: Ferramenta de linha de comando para interagir com o cluster Kubernetes.

Para iniciar a instalação e configuração automática das dependências, simplesmente execute o script `create-cluster.sh`.

## Uso

Execute o script `create-cluster.sh` para criar o cluster Kubernetes com o Kind:

```bash
./create-cluster.sh
```

O script principal configura um cluster Kubernetes local utilizando as definições especificadas no arquivo de configuração `config/config.yaml`.

### Parâmetros Adicionais

O script aceita os seguintes parâmetros para customização da instalação do cluster:

- `--no-ingress`: Não instala o NGINX Ingress.
- `--no-metallb`: Não instala o Metal LB.
- `--cluster-name <nome>`: Especifica o nome do cluster a ser criado.
- `-h` ou `--help`: Exibe o menu de ajuda.

## Estrutura do Projeto

- `config/`: Contém as configurações do cluster Kubernetes.
- `libs/`: Inclui scripts que automatizam a instalação das dependências (`functions_deps.sh`) e funções principais do script (`functions_main.sh`).
- `create-cluster.sh`: Script principal que automatiza a criação do cluster.

## Gestão de Erros

O script `functions_main.sh` inclui uma função `_error()` que é chamada quando parâmetros inválidos são passados, fornecendo uma mensagem de erro e chamando o menu de ajuda.

## Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
