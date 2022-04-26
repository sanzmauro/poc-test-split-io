# frozen_string_literal: true

# NOTE: bad practice, just for a quick POC. Credentials should not exist in code!\
split_factory = SplitIoClient::SplitFactory.new(ENV['SPLIT_IO_API_KEY'])
SPLIT_CLIENT = split_factory.client

begin
  SPLIT_CLIENT.block_until_ready
rescue SplitIoClient::SDKBlockerTimeoutExpiredException => e
  puts '=> Split.io SDK is not ready'
  raise e
end
