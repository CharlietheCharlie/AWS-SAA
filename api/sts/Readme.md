## Create a user with no permission
```
aws iam create-user --user-name sts-test-user-96gg
aws iam create-access-key --user-name sts-test-user-96gg --output table
```

## login with cli

## test who you are
```
aws sts get-caller-identity
```

## make sure you don't have access to S3
```
aws s3 ls
```

## create an assume role and create new bucket
```
./deploy
```

# let new user assume role
```
aws sts assume-role \
--role-arn arn:aws:iam::861164220281:role/my-sts-stack-StsRole-xuNCFnON7yLS \
--role-session-name s3-sts-session
```

## test 
```
aws s3 ls s3://my-bucket-cw8333
echo "hello sts" > test.txt
aws s3 cp test.txt s3://my-bucket-cw8333/ --profile assumed-role-test
```

## teardown 
```
aws iam delete-user-policy --user-name sts-test-user-96gg --policy-name S3Access
aws iam delete-access-key --access-key-id AKIA4RALDF544NPG2XWE --user-name sts-test-user-96gg
aws iam delete-user --user-name sts-test-user-96gg
```