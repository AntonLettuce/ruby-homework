# frozen_string_literal: true

require "test_helper"
require 'net/http'
require_relative "../lib/ipgeobase/version"

class TestIpgeobase < Minitest::Test
  def setup
    @ip = '83.169.216.199'
    @uri = "http://ip-api.com/xml/#{@ip}?fields=211"
    stub_request(:get, @uri)
      .to_return(body:
      '<?xml version="1.0" encoding="UTF-8"?>
      <query>
        <country>Russia</country>
        <countryCode>RU</countryCode>
        <city>Yekaterinburg</city>
        <lat>56.8439</lat>
        <lon>60.6524</lon>
      </query>')
  end

  def test_for_getting_something
    result = Ipgeobase.lookup(URI(@ip));
    assert_equal false, result.nil?
  end

  def test_for_existing_property
    result = Ipgeobase.lookup(URI(@ip));
    assert_equal 'Russia', result.country
  end
end
