# config/initializers/carrierwave.rb
# This file is not created by default so you might have to create it yourself.


CarrierWave.configure do |config|
  config.fog_provider = "fog/aws"

  config.fog_credentials = {
    :provider               => 'AWS',                             # required
    :aws_access_key_id      => ENV['S3_ACCESS_ID'],               # required
    :aws_secret_access_key  => ENV['S3_SECRET_KEY'],              # required
    :region                 => 'us-west-2'                        # optional, defaults to 'us-east-1'
  }

  config.fog_directory  = 'chaldea-foundation'              # required
  #config.fog_host       = 'https://assets.example.com'           # optional, defaults to nil
  #config.fog_public     = false                                  # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
