require 'net/http'
require 'nokogiri'
require 'uri'
require 'ostruct'

module LookupIP
  class V4
    def self.address(ip)
      @ip = ip
      uri = URI("https://www.iplocation.net/?query=#{@ip}&submit=IP+Lookup")
      page = Net::HTTP.get(uri)
      page = Nokogiri::HTML(page)
      @results = OpenStruct.new({
        ip: @ip,
        country: page.xpath('//*[@id="wrapper"]/section/div/div/div[1]/div[8]/div/table/tbody[1]/tr/td[2]').text.strip,
        state: page.xpath('//*[@id="wrapper"]/section/div/div/div[1]/div[8]/div/table/tbody[1]/tr/td[3]').text.strip,
        city: page.xpath('//*[@id="wrapper"]/section/div/div/div[1]/div[8]/div/table/tbody[1]/tr/td[4]').text.strip,
        isp: page.xpath('//*[@id="wrapper"]/section/div/div/div[1]/div[8]/div/table/tbody[2]/tr/td[1]').text.strip
      })
    end
  end
end
