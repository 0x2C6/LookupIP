require 'net/http'
require 'nokogiri'
require 'uri'

module LookupIP
  class V4
    attr_reader :ip, :country, :state, :city, :isp
    def initialize(ip, country, state, city, isp)
      @ip = ip
      @country = country
      @state = state
      @city = city
      @isp = isp
    end

    def self.address(ip)
      @ip = ip
      uri = URI("https://www.iplocation.net/?query=#{@ip}&submit=IP+Lookup")
      page = Net::HTTP.get(uri)
      page = Nokogiri::HTML(page)
      @results = LookupIP::V4.new(
        @ip,
        page.xpath('//*[@id="wrapper"]/section/div/div/div[1]/div[8]/div/table/tbody[1]/tr/td[2]').text.strip,
        page.xpath('//*[@id="wrapper"]/section/div/div/div[1]/div[8]/div/table/tbody[1]/tr/td[3]').text.strip,
        page.xpath('//*[@id="wrapper"]/section/div/div/div[1]/div[8]/div/table/tbody[1]/tr/td[4]').text.strip,
        page.xpath('//*[@id="wrapper"]/section/div/div/div[1]/div[8]/div/table/tbody[2]/tr/td[1]').text.strip
      )
    end
  end
end
