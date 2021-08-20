# Terraform-IIS-Nuget
  
  
  
## CONTEXTE
&nbsp; 
**Ce projet, basé sur des instances AWS EC2 Windows, déploie:**

   - un bastion permettant par rebond de se connecter à un serveur Windows IIS. Il n'est joignable que depuis une adresse IP publique autorisée 
    
   - un serveur IIS configuré comme repo local Nuget pour déployer des packages chocolatey. Seuls 3 packages sont déployables pour l'exemple: Firefox, Sublimetext et Notepad++)


    
    
   &nbsp; 
    
**L'infrastructure côté AWS comprend les éléments suivants:**

            - Un VPC (MyVPC): 10.0.0.0/16
            - Un Public Subnet (MyPublicSubnet): 10.0.2.0/24
            - Un Private Subnet (MyPrivateSubnet): 10.0.3.0/24
            - Une Internet Gateway (MyGateway)
            - Un Bucket S3
            - Une NAT Gateway (NAT)
            - Un rôle IAM (ec2_s3_role)
            - Des Route Table
            
            
      


&nbsp;


## PREREQUIS
1. Avoir un compte AWS avec des droits suffisants

2. Télécharger Terraform et finaliser l'installation en l'ajoutant à vos variables d'environnement
    https://learn.hashicorp.com/tutorials/terraform/install-cli

3. Ajouter son adresse IP publique **(W.X.Y.Z)** dans le fichier: `08_security_groups` pour pouvoir se connecter au bastion
           
           resource "aws_security_group" "libero-sg-bastion" {
           description = "Allow TLS inbound traffic"
           vpc_id      = aws_vpc.libero-vpc.id

           ingress {
             from_port   = 3389
             to_port     = 3389
             protocol    = "tcp"
             cidr_blocks = ["W.X.Y.Z/32"]
           }
           
           
             

4. Exporter les variables d'environnement concernant les credentials AWS 

   **L'ACCESS_KEY_ID:**
   
            export AWS_ACCESS_KEY_ID="Votre AWS ACCESS KEY ID"
            
   **Le SECRET_ACCESS_ID:**
          
            export AWS_SECRET_ACCESS_KEY="Votre AWS SECRET ACCESS KEY"
       

5. Vous pouvez également gérer le profil, qui se placera dans:  `~/.aws/credentials` en lançant la commande suivante:

          aws configure
          
   On vous demandera de renseigner les trois éléments ci-dessous:
   
            AWS Access Key ID: 
           
            AWS Secret Access Key: 
           
            Default region name : 
           
           
6. Générer une paire de clefs publique/privée que vous nommerez:
          
           - mykey.pem
           
           - mykey.pub
           
   et que vous stockerez dans le répertoire `data\key-pair`
   
        

&nbsp;
  
## RECUPERATION DES FICHIERS
1. Créer un dossier sur votre poste et nommer-le comme vous le souhaitez, il nous servira pour héberger le git clone.
   En Powershell, aller sur ce nouveau dossier 



2. Cloner le repo contenant les fichiers Terraform avec un  
          `git clone https://github.com/liberops/Terraform-IIS-Nuget.git`  
          
3. Se déplacer dans le dossier Terraform-IIS-Nuget
  
 

  &nbsp;
  
## CREATION DE L'INFRASTRUCTURE
Vérifier avec `DIR` ce qui se trouve dedans, normalement vous retrouvez ce qu'il y avait dans le dépôt Github cloné

Lancer les commandes Terraform suivantes:

             terraform init
  
             terraform plan
  
             terraform apply


Après avoir validé par **YES**, la construction de l'infrastructure se lance et les outputs Terraform sont générés, ils vous servironst pour vous connecter au bastion et serveur IIS_Nuget: 

  
            - L'instance ID du serveur IIS_nuget
            - L'adresse IP privée du serveur IIS_nuget
            - Le DNS public du serveur IIS_nuget
            - Le mot de passe Administrator du serveur IIS_nuget
            - L'instance ID du bastion
            - L'adresse IP privée du bastion
            - Le mot de passe Administrator du bastion
  
 &nbsp;
## SUPPRESSION DE L'INFRASTRUCTURE
Pour éviter les coûts, pensez à supprimer votre infrastructure avec la commande:

             terraform destroy
