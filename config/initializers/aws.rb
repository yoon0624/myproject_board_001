CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAIVE5PS75KPOS2J4Q',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
    endpoint:              'https://s3.ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'yoon0624'                          # required
end