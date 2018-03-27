# terraform-vsi

Procedimento de instalação:

1. Download terraform [(terraform.io)](terraform.io)

2. Copiar o binário para /usr/local/bin

Criar uma pasta para os arquivos TF
```/bin/bash
mkdir ~/teste-terraform
cd ~/teste-terraform
terraform init
```

Download do Plug-In IBM Cloud (https://github.com/IBM-Cloud/terraform-provider-ibm/releases) e descompactar

Criar a Pasta ~/terraform.d/plugins
```/bin/bash
mkdir ~/terraform.d/plugins
```

Download do Plug-In IBM Cloud (https://github.com/IBM-Cloud/terraform-provider-ibm/releases) e descompactar

Copiar o binário (terraform-provider-ibm) para a pasta ~/terraform.d/plugin
```
mv ~/teste-terraform/terraform-provider-ibm ~/terraform.d/plugins
```

Clonar o script de teste
```
git clone <endereço git>
cd ~/teste-terraform/terraform-vsi
```
Modificar os parâmetros de API (bluemix e softlayer) no arquivo itiro.tf
Modificar os parâmetros do aqruivo itiro.tf (sshkey id, subnets, etc)

Verificar se está tudo OK com o arquivo TF.
```
terraform plan
```

Criar as VSis e o Load Balancer
```
terraform apply
```

Comandos básicos:
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
