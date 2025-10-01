## create new S3 bucket(make_bucket)

```md
aws s3 mb s3://create-metadata-bucket-996
```

### create file 
```
echo "Hey Hey" > metatry.txt
```

## upload with metadata
```
aws s3api put-object --bucket create-metadata-bucket-996 --key metatry.txt --body metatry.txt --metadata TryMeta=trytry
```

# get head object
```
aws s3api head-object --bucket create-metadata-bucket-996 --key metatry.txt 
```