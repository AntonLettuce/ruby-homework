# frozen_string_literal: true

require_relative "ipgeobase/version"
require "addressable/uri"
require 'net/http'
require 'happymapper'

module Ipgeobase
  class Error < StandardError; end
  # Your code goes here...
  def self.lookup ip
    url = Addressable::URI.parse("http://ip-api.com/xml/#{ip}?fields=211")
    response = Net::HTTP.get(url.normalize)
    HappyMapper.parse(response)
  end
end