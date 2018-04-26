aws ec2 create-security-group --group-name GBTEST --description Lab infonuagique group
aws ec2 authorize-security-group-ingress --group-id sg-674fbf0c --protocol tcp --port 22 --cidr 0.0.0.0/0 --region ca-central-1
aws ec2 run-instances --image-id ami-11bf0675 --security-group-ids sg-e72ad88c --count 1 --instance-type t2.micro --key-name gbouchakey2 --query 'Instances[0].InstanceId'
