# create nacl
```
aws ec2 create-network-acl \
    --vpc-id vpc-0aafed0364f21e425  \
    --region ap-northeast-1
```
# get AMI for linux 2
```
aws ec2 describe-images \
  --region ap-northeast-1 \
  --owners amazon \
  --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" "Name=state,Values=available" \
  --query 'Images[0].ImageId' \
  --output text
```

# create ec2
```
aws ec2 run-instances \
  --image-id ami-0a0b7c4e2f469a7e5 \
  --instance-type t2.micro \
  --region ap-northeast-1 \
  --network-interfaces "DeviceIndex=0,SubnetId=subnet-0a0b7c4e2f469a7e5,Groups=[sg-0a0b7c4e2f469a7e5],AssociatePublicIpAddress=true" \
  --query 'Instances[0].InstanceId' \
  --output text
```
