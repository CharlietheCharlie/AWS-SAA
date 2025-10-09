

# create IAM policy

```
aws iam create-policy \
    --policy-name my-custom-policy \
    --policy-document "$(yq -o json policy.yaml)" \
    --region ap-northeast-1
```

# attach policy to user

```
aws iam attach-user-policy \
    --user-name Charlie \
    --policy-arn arn:aws:iam::861164220281:policy/my-custom-policy \
    --region ap-northeast-1
```