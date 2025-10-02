## create new S3 bucket(make_bucket)

```
aws s3 mb s3://create-cors2-bucket-c999
```

## change block public access

```
aws s3api put-public-access-block \
    --bucket create-cors2-bucket-c999 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## create bucket policy
```
aws s3api put-bucket-policy \
    --bucket create-cors2-bucket-c999 \
    --policy file://policy2.json
```

## turn on static website hosting
```
aws s3 website s3://create-cors2-bucket-c999/ \
    --index-document index.html \
    --error-document error.html
```

## upload index.html and include resource that would be cross origin
```
aws s3 cp grant.js s3://create-cors2-bucket-c999/
```

## get website url
```
http://create-cors2-bucket-c999.s3-website-ap-northeast-1.amazonaws.com/grant.js 
```


## apply cors policy
```
aws s3api put-bucket-cors --bucket create-cors2-bucket-c999  --cors-configuration file://cors.json
```
