require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

# get the bucket name from the environment variable
bucket_name = ENV['BUCKET_NAME']
region = 'ap-northeast-1'

# initialize the s3 client
client = Aws::S3::Client.new

# create the bucket
response = client.create_bucket({
    bucket: bucket_name,
    create_bucket_configuration: {
        location_constraint: region
    }
})

# check if the bucket was created 
# enter exit! to exit the program
# binding.pry

number_of_files = 1 + rand(6)
puts "number of files: #{number_of_files}"

# upload files
number_of_files.times.each do |index|
    file_name = "file-#{index}.txt"
    content = SecureRandom.uuid # random string content

    # Directly upload string content (no tmp file needed)
    client.put_object(
      bucket: bucket_name,
      key: file_name,
      body: content
    )

    puts "uploaded file name: #{file_name} content: #{content}"
end

puts "done"
