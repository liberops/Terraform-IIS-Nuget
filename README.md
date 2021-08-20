# Terraform-IIS-Nuget
  
  
  
## PREREQUIS

1. Ajouter son adresse IP publique dans le fichier: `08_security_groups` pour pouvoir se connecter au bastion
           
           resource "aws_security_group" "libero-sg-bastion" {
           description = "Allow TLS inbound traffic"
           vpc_id      = aws_vpc.libero-vpc.id

           ingress {
             from_port   = 3389
             to_port     = 3389
             protocol    = "tcp"
             cidr_blocks = ["W.X.Y.Z/32"]
           }
           
           
             

2. Exporter les variables d'environnement concernant les credentials AWS 

        $ export AWS_ACCESS_KEY_ID="Votre AWS ACCESS KEY ID"
        $ export AWS_SECRET_ACCESS_KEY="Votre AWS SECRET ACCESS KEY"
       

3. Vous pouvez également gérer le profil sur votre poste, qui ira se placer dans:  `~/.aws/credentials`

        $ aws configure
        $ AWS Access Key ID: Votre AWS ACCESS KEY ID
        $ AWS Secret Access Key: Votre AWS SECRET ACCESS KEY
        $ Default region name : aws-region
        



  
  
  
## RECUPERATION DES FICHIERS
1. Créer un dossier et nommer-le comme vous le souhaitez, il nous servira pour héberger le git clone    



2. Cloner le repo contenant les fichiers Terraform avec un  
`git-clone https://github.com/liberops/Terraform-IIS-Nuget.git`  
  
 





  
  
## CREATION DE L'INFRASTRUCTURE
En Powershell, aller sur votre dossier de travail créé juste avant pour ce projet
Vérifier avec `DIR` ce qui se trouve dedans, normalement vous retrouvez ce qu'il yavait dans le dépôt Github cloné

Lancer les commandes Terraform suivantes:
`$ terraform init
$ terraform plan
$ terraform apply`

Vous allez devoir saisir les informations liées à votre configuration 
donc les informations personnalisées dans le **docker-compose.yml** 


                                               | 
    Le répertoire de données est:              | /data
    La base de données est:                    | MySQL/MariaDB
    Lutilisateur de la base de données est:    | nextcloud
    Le mot de passe de la base de données est: | MOTDEPASSE2
    Le nom de la base de données est:          | nextcloud
    localhost                                  | mariadb


Cliquez sur **Terminer la configuration**  

Votre service Nextcloud est en place avec des données persistantes sur votre machine et tournant avec 2 
conteneurs Docker linuxserver/nextcloud et linuxserver/mariadb
