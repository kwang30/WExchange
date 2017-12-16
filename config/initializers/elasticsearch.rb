#
require 'faraday_middleware/aws_signers_v4'


if Rails.env == "production"
  Searchkick.client = Elasticsearch::Client.new(url: ENV['ELASTICSEARCH_URL']) do |f|
    f.request :aws_signers_v4,
              credentials: Aws::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
              service_name: 'es',
              region: ENV['AWS_REGION']
  end
else
  url = 'http://localhost:9200/'
    Elasticsearch::Model.client = Elasticsearch::Client.new url: url
  Searchkick.client = Elasticsearch::Client.new(hosts: url, retry_on_failure: true, transport_options: {request: {timeout: 250}})
end