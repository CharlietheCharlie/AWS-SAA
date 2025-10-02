require "openssl"
require "aws-sdk-s3"

bucket = 'client-enc-bucket-c999'
object_key = 'encFile.txt'

# 產生一個 256-bit AES 對稱金鑰
aes_key = OpenSSL::Cipher.new('aes-256-gcm').random_key

# 建立加密版的 S3 client
s3_enc = Aws::S3::EncryptionV2::Client.new(
  encryption_key: aes_key,
  key_wrap_schema: :aes_gcm, # 金鑰包裝方式
  content_encryption_schema: :aes_gcm_no_padding, # 內容加密方式
  security_profile: :v2     # EncryptionV2 profile
)

# 上傳 (會自動在本地加密，再丟到 S3)
s3_enc.put_object(
  bucket: bucket,
  key: object_key,
  body: "Hello Enc"
)

# 下載 (會自動解密)
resp = s3_enc.get_object(
  bucket: bucket,
  key: object_key
)

puts "Decrypted content: #{resp.body.read}"


