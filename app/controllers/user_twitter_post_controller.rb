require 'rubygems'
require 'oauth'
require 'json'

consumer_key = OAuth::Consumer.new(
  "Q64nfIxasfV931aEg6Y4dg",
  "xzvvYJBzXj7IpByPY2QjDaRBvwiZdr4hfgFsSl8sA")
access_token = OAuth::Token.new(
  "1660787328-jglAycaP3mVWiua4pmUEyP2bbfe2ZAE2Zg3POYf",
  "EzDvs5Gql82E2z0lsPz5rNsXiRBn9bWMRQO5B8c")

baseurl = "https://api.twitter.com"
path    = "/1.1/statuses/update.json"
address = URI("#{baseurl}#{path}")
request = Net::HTTP::Post.new address.request_uri
request.set_form_data(
  "status" => "We need to get twilio data from here",
)


http             = Net::HTTP.new address.host, address.port
http.use_ssl     = true
http.verify_mode = OpenSSL::SSL::VERIFY_PEER

request.oauth! http, consumer_key, access_token
http.start
response = http.request request