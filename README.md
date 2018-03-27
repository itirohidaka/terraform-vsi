# Utilizando Terraform para a criação de VSi (Virtual Server) na IBM Cloud

Procedimento de instalação no Mac OSx

**1.** Download terraform [(terraform.io)](https://terraform.io)

**2.** Copiar o binário para /usr/local/bin

**3.** Criar uma pasta para os arquivos TF
```/bin/bash
mkdir ~/teste-terraform
cd ~/teste-terraform
terraform init
```

**4.** Download do Plug-In IBM Cloud (https://github.com/IBM-Cloud/terraform-provider-ibm/releases) e descompactar

**5.** Criar a Pasta ~/terraform.d/plugins
```/bin/bash
mkdir ~/terraform.d/plugins
```

**6.** Download do Plug-In IBM Cloud (https://github.com/IBM-Cloud/terraform-provider-ibm/releases) e descompactar

**7.** Copiar o binário (terraform-provider-ibm) para a pasta ~/terraform.d/plugin
```
mv ~/teste-terraform/terraform-provider-ibm ~/terraform.d/plugins
```

**8.** Clonar o script de teste
```
git clone <endereço git>
cd ~/teste-terraform/terraform-vsi
```
**9.** Modificar os parâmetros de API (bluemix e softlayer) no arquivo itiro.tf

**10.** Modificar os parâmetros do aqruivo itiro.tf (sshkey id, subnets, etc)

**11.** Verificar se está tudo OK com o arquivo TF.
```
terraform plan
```

**12.** Criar as VSis e o Load Balancer
```
terraform apply
```

**Comandos básicos:**
terraform init

terraform plan

terraform get

terraform apply

**Referências do Terraform:**

[Referência IBM Cloud Plug In](https://ibm-cloud.github.io/tf-ibm-docs/v0.7.0/)

[Github do Terraform Provider IBM](https://github.com/IBM-Cloud/terraform-provider-ibm)

[Download do PlugIn IBM Cloud](https://github.com/IBM-Cloud/terraform-provider-ibm/releases)

[Artigo sobre Terraform e Cluster K8s](https://www.ibm.com/blogs/bluemix/2017/09/using-ibm-cloud-provider-provision-infrastructure/)

[Sample Code](https://github.com/Cloud-Schematics)
