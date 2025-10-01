## create new S3 bucket(make_bucket)

```md
aws s3 mb s3://create-another-bucket-c999
```

## create a file for checksum

```
echo "hey you checkboy" > checkfile.txt
```

## get file for md5

```
md5sum checkfile.txt
```

# cd98bfb5f7ce16f7f355db4f014894e8 checkfile.txt

## upload file and see etag

```
aws s3 cp checkfile.txt s3://create-another-bucket-c999
aws s3api head-object --bucket create-another-bucket-c999 --key checkfile.txt
```

### upload file with different kind of checksum

# calculate the checksum first
```
cksum -o 3 checkfile.txt
echo -n -e '\x16\xa7\xb2\x62' | base64
```

# then upload new file with calculated checksum, or just let s3 auto check
```
aws s3api put-object \
  --bucket create-another-bucket-c999 \
  --key new-checkfile.txt \
  --body checkfile.txt \
  --checksum-algorithm CRC32 \
  --checksum-crc32 "FqeyYg==" ## 
```
