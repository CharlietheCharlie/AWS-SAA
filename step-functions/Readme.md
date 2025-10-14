# create new s3 bucket(make_bucket)
```
aws s3 mb s3://sf-example-bucket-c999
```
# enable event bridge
```
aws s3api put-bucket-notification-configuration \
    --region ap-northeast-1 \
    --bucket sf-example-bucket-c999 \
    --notification-configuration '{"EventBridgeConfiguration": {}}'
```
# create event rule
```
aws events put-rule \
  --name s3-to-sf-rule \
  --event-pattern '{
    "source": ["aws.s3"],
    "detail-type": ["Object Created"],
    "detail": {
      "bucket": {
        "name": ["sf-example-bucket-c999"]
      }
    }
  }' \
  --region ap-northeast-1
```

# get target
```
aws stepfunctions list-state-machines --region ap-northeast-1
```

# add role to target
```
aws iam create-role \
  --role-name EventBridgeToSFRole \
  --assume-role-policy-document '{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": { "Service": "events.amazonaws.com" },
        "Action": "sts:AssumeRole"
      }
    ]
  }'

aws iam put-role-policy \
  --role-name EventBridgeToSFRole \
  --policy-name AllowStepFunctionStart \
  --policy-document '{
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": "states:StartExecution",
        "Resource": "arn:aws:states:ap-northeast-1:861164220281:stateMachine:my-example-sf"
      }
    ]
  }'
```

# add target
```
aws events put-targets \
  --rule s3-to-sf-rule \
  --targets "[
    {
      \"Id\": \"1\",
      \"Arn\": \"arn:aws:states:ap-northeast-1:861164220281:stateMachine:my-example-sf\",
      \"RoleArn\": \"arn:aws:iam::861164220281:role/EventBridgeToSFRole\"
    }
  ]" \
  --region ap-northeast-1
```


# upload file
```
aws s3 cp hello.txt s3://sf-example-bucket-c999 
```

