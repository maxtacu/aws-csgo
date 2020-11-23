```
terraform apply
```
Then install dependencies and configure server
```
ansible-playbook -i aws_ec2.yaml playbook.yaml
```
Login into server via ssh and finish the configuration from the `csgoserver` user
```
./linuxgsm.sh csgoserver
./csgoserver install
```
Start the server
```
./csgoserver start
```