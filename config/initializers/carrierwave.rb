CarrierWave.configure do |config|
  if Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.storage = :file
    end
  end

  if Rails.env.production?
    config.storage    = :aws
    config.aws_bucket = ENV.fetch('S3_BUCKET_NAME')
    config.aws_acl    = 'public-read'

    config.aws_credentials = {
      :access_key_id          => ENV.fetch('S3_ACCESS_ID'),
      :secret_access_key      => ENV.fetch('S3_SECRET_KEY'),
      :region                 => 'us-west-1'
    }

    config.aws_attributes = {
      expires: 1.week.from_now.httpdate,
      cache_control: 'max-age=604800'
    }
  end
end
