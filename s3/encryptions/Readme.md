## create new S3 bucket(make_bucket)

```
aws s3 mb s3://create-enc-bucket-c999
```

## create file with default SSE-S3
```
echo "Hello Enc" > encFile.txt
aws s3 cp encFile.txt s3://create-enc-bucket-c999
```

## change encryption option for object to SSE-KMS (need to create key first)
```
aws s3api put-object \
--bucket create-enc-bucket-c999 \
--key encFile.txt \
--body encFile.txt \
--server-side-encryption aws:kms \
--ssekms-key-id $(key)
```

## change encryption option for object to SSE-C
```
ENCODED_KEY=$(openssl rand -base64 32)
MD5_VALUE=$(echo -n "$ENCODED_KEY" | base64 --decode | md5sum | awk '{print $1}' | xxd -r -p | base64)
aws s3api put-object \
  --bucket create-enc-bucket-c999 \
  --key encFile.txt \
  --body encFile.txt \
  --sse-customer-algorithm AES256 \
  --sse-customer-key "$ENCODED_KEY" \
  --sse-customer-key-md5 "$MD5_VALUE"
```
