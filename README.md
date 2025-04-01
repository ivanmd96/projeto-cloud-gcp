# 🌩️ Projeto Cloud GCP – Infraestrutura com Terraform, Ansible e Jenkins (v2)

Este projeto provisiona uma infraestrutura completa no **Google Cloud Platform (GCP)** utilizando **Terraform** e realiza a configuração automatizada de máquinas virtuais (VMs) com **Ansible**, orquestrado via **Jenkins**.

## 📂 Estrutura do Repositório

```bash
projeto-cloud-gcp/
├── ansible/
│   ├── ansible.cfg           # Configuração do Ansible
│   ├── inventory             # Gerado dinamicamente pelo Terraform
│   └── playbook.yml          # Playbook principal para configurar as VMs
│
├── environments/
│   ├── dev.tfvars            # Variáveis para o ambiente de desenvolvimento
│   └── prd.tfvars            # Variáveis para o ambiente de produção
│
├── modules/
│   ├── network/              # Módulo Terraform para sub-redes
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   │
│   └── vm/                   # Módulo Terraform para máquinas virtuais
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
│
├── terraform/
│   ├── main.tf               # Módulo raiz que conecta tudo
│   ├── variables.tf          # Variáveis globais
│   └── outputs.tf            # Saídas globais (ex: IP da VM)
│
├── terraform-key.json        # Chave de serviço GCP (adicionada via Jenkins)
├── jenkinsfile               # Pipeline declarativa que executa todo o fluxo
└── README.md                 # Documentação do projeto
```

## ☁️ Visão Geral

### O que esse projeto faz:
- Reutiliza uma **VPC existente** no GCP.
- Cria duas **sub-redes**: uma para `dev` e outra para `prd`.
- Cria uma **máquina virtual Ubuntu** para cada ambiente.
- Gera o **inventory** automaticamente para o Ansible.
- Executa um **playbook para instalar Python nas VMs**.
- Garante **idempotência**: se já existe, não recria.

## 🧰 Requisitos

- Conta GCP com projeto ativo
- Chave de serviço GCP (formato `.json`)
- Jenkins rodando (pode estar dentro do GCP ou local)
- Plugins Jenkins:
  - Git
  - Pipeline
  - AnsiColor
  - Credentials Binding
- Terraform ≥ 1.5
- Ansible ≥ 2.12

## 🚀 Como preparar o ambiente

### 1. Configurar no GCP

- Criar manualmente:
  - VPC chamada `projeto-cloud`
  - Regra de firewall para permitir SSH (`tcp:22`)
- Criar a chave de serviço (`terraform-key.json`) com permissões de editor no projeto GCP.

### 2. Adicionar Credenciais no Jenkins

- **terraform-key.json**: tipo "Secret file" com ID `terraform-key`.
- **Chave pública SSH**: tipo "Secret text" com ID `ssh-public-key`.

### 3. Executar Pipeline

1. Configure o repositório Git no Jenkins com **Multi-branch Pipeline**.
2. Ao rodar a branch `dev`:
   - Será criada uma sub-rede `subnet-dev` e uma VM `vm-dev`.
3. Ao rodar a branch `main`:
   - Será criada uma sub-rede `subnet-prd` e uma VM `vm-prd`.

Se os recursos já existirem, **nada será recriado**.

## 🧪 Testes

- Para testar a criação:
  ```bash
  git checkout dev
  git push origin dev
  ```
- Para testar produção:
  ```bash
  git checkout main
  git push origin main
  ```

## ✅ Próximos Passos (V3)

- Separar infraestrutura (`infra`) e configuração (`config`) em branches ou repositórios.
- Adicionar mais serviços (ex: CloudSQL, GKE).
- Implementar notificações via Slack ou email no Jenkins.

Infraestrutura GCP automatizada com foco em **boas práticas**, **idempotência** e **modularização**.