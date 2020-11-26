# Fully automated AWS Terraform + Ansible LinuxGSM configuration for CS:GO
1. Update AWS configuration in `terraform/variables.tf` file according to your needs or you can just keep it with defaults.
2. Configure AWS programmatic access and then execute from the `terraform` folder:
```
terraform apply
```
2. Get the steam game token from https://steamcommunity.com/dev/managegameservers  
3. Update server/game configurations in `ansible/files` folder according to your needs  
5. Install dependencies and configure server from the `ansible` folder:
```
ansible-playbook -i aws_ec2.yaml playbook.yaml
```
6. Connect to your server using public address and passwords from `files/server.cfg`
```
server_ip_address:27015; password serverpassword; rcon_password rconpassword
```