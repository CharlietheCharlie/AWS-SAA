## create new S3 bucket(make_bucket)

```md
aws s3 mb s3://create-sclass-bucket-c999
```

## create a file for changed storage class

```
echo "hey you change storage class" > classFile.txt
aws s3 cp classFile.txt s3://create-sclass-bucket-c999 --storage-class STANDARD_IA
```

## clean up
```
aws s3 rm s3://create-sclass-bucket-c999/classFile.txt
aws s3 rb s3://create-sclass-bucket-c999
```