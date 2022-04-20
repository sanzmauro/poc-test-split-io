# frozen_string_literal: true

# NOTE: bad practice, just for a quick POC. Credentials should not exist in code!
split_factory =
  SplitIoClient::SplitFactory.new(ENV['SPLIT_IO_API_KEY'])
SPLIT_CLIENT = split_factory.client
Rails.configuration.split_factory = split_factory

begin
  SPLIT_CLIENT.block_until_ready
rescue SplitIoClient::SDKBlockerTimeoutExpiredException => error 
  Rails.logger.error '=> Split.io SDK is not ready'
  raise error
end
