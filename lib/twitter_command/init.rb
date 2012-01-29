#!/usr/bin/env ruby
# coding: utf-8

require "rubygems"
require "oauth"
require "yaml"
require "fileutils"

data = { "consumer" => {}, "access_token" => {} }

puts "Input the consumer key of your twitter application: "
data["consumer"]["key"] = gets.chomp

puts "Input the consumer secret of your twitter application: "
data["consumer"]["secret"] = gets.chomp


consumer = OAuth::Consumer.new(
  data["consumer"]["key"],
  data["consumer"]["secret"],
  :site => "https://twitter.com/"
)

request_token = consumer.get_request_token

puts "Open this url in your web browser and get your pin code:"
puts request_token.authorize_url

# ブラウザでアクセス

puts "Input your pin code:"

pin = gets.chomp

access_token = request_token.get_access_token(:oauth_verifier => pin);

data["access_token"]["key"] = access_token.token
data["access_token"]["secret"] = access_token.secret

auth_file = File.expand_path(".twitter_command", "~")
File.open(auth_file, "w") do |f|
  YAML.dump(data, f)
end

FileUtils.chmod(0600, auth_file)
