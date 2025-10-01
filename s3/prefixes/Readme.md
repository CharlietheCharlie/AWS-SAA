## create new S3 bucket(make_bucket)

```md
aws s3 mb s3://create-prefix-bucket-996
```

## add folder, key + object name must smaller then 1024 bytes

```
aws s3api put-object --bucket create-prefix-bucket-996 --key "yo/" 
```
