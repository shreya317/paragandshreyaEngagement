require 'aws-sdk-v1'
require 'csv'

def parse_guest_login
  s3 = AWS::S3.new(
    :access_key_id => ENV["AW_ACCESS_KEY_ID"],
    :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"]
  )

  bucket = s3.buckets['paragandshreya']
  file = bucket.objects.first
  body = file.read

  CSV.parse(body, headers: true) do |row|
    row_hash = row.to_hash
    guest = Guest.new(row_hash)
    guest.save
  end
end