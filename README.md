
# 🚀 Projeto: Provisionamento de Infraestrutura no GCP com Terraform, Ansible e Jenkins

Este projeto realiza a criação automatizada de uma infraestrutura no Google Cloud Platform (GCP) utilizando:

- **Terraform**: para criação da infraestrutura (rede, sub-rede, firewall e VM)
- **Ansible**: para provisionamento da VM com pacotes e configurações iniciais
- **Jenkins**: para orquestrar o pipeline CI/CD e automatizar todo o processo
- **GitHub**: como repositório do projeto com os manifestos de infraestrutura e playbooks

---

## 📦 Estrutura do Projeto

```bash
.
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── terraform-key.json   # NÃO subir no git
├── ansible/
│   ├── playbook.yml
│   └── inventory            # gerado dinamicamente
├── jenkinsfile
└── README.md
```

---

## 🛠️ Passo a Passo para Subir o Ambiente

### 1. ✅ Criar repositório no GitHub
Crie um repositório novo e clone na sua máquina local.

### 2. ✅ Instalar as ferramentas na máquina local (para testes)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/index.html)
- [Git](https://git-scm.com/downloads)

### 3. ✅ Subir uma VM com Jenkins no GCP
- Vá até o [Marketplace do GCP](https://console.cloud.google.com/marketplace)
- Busque por **Jenkins**
- Escolha uma imagem oficial e clique em "Launch"
- Após subir, conecte via **SSH** na VM Jenkins

---

## ⚙️ Configuração dentro da VM Jenkins

### 4. ✅ Instalar Terraform e Ansible na VM do Jenkins

```bash
# Terraform
wget https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip
unzip terraform_1.6.6_linux_amd64.zip
sudo mv terraform /usr/local/bin

# Ansible
sudo apt update && sudo apt install ansible -y
```

---

### 5. ✅ Gerar chave SSH (ou copiar do root)

```bash
# Gerar chave como root
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa

# Copiar para o Jenkins
sudo mkdir -p /var/lib/jenkins/.ssh
sudo cp ~/.ssh/id_rsa /var/lib/jenkins/.ssh/
sudo cp ~/.ssh/id_rsa.pub /var/lib/jenkins/.ssh/
sudo chown -R jenkins:jenkins /var/lib/jenkins/.ssh
sudo chmod 700 /var/lib/jenkins/.ssh
sudo chmod 600 /var/lib/jenkins/.ssh/id_rsa
```

---

### 6. ✅ Adicionar chave pública no `main.tf` via `metadata.ssh-keys`

```hcl
metadata = {
  ssh-keys = "ubuntu:{file(var.ssh_key_path)}"
}
```

---

### 7. ✅ Criar Service Account no GCP com as permissões:
- `Compute Admin`
- `Service Account User`

Baixe a chave JSON e coloque dentro da pasta `terraform/` como `terraform-key.json`.

---

### 8. ✅ Configurar Jenkins

- Crie um **novo job do tipo pipeline**
- Adicione as **credenciais do GitHub** (SSH ou HTTPS)
- Configure o **Pipeline script from SCM**
- Use o nome do seu `jenkinsfile`

---

### 9. ✅ Estrutura do Jenkinsfile

Inclui as etapas:

- Checkout do código
- `terraform init` e `apply`
- Captura do IP gerado pela VM
- Geração automática do `inventory` para Ansible
- Execução do `ansible-playbook`

---

## ✅ Resultado Final

- Jenkins sobe a infra no GCP
- Cria uma VM Ubuntu
- Provisiona via Ansible com Python e demais pacotes
- Tudo versionado no GitHub com CI/CD completo 🚀

---

## 📅 Documentação gerada em: 25/03/2025
