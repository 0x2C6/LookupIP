require "test_helper"

class LookupIPTest < Minitest::Test
  def setup
    @ipv4 = LookupIP::V4.address '30.104.194.91'
  end

  def test_ipv4_country
    assert_equal 'United States', @ipv4.country
  end

  def test_ipv4_state
    assert_equal 'Ohio', @ipv4.state
  end

  def test_ipv4_city
    assert_equal 'Columbus', @ipv4.city
  end

  def test_ipv4_isp
    assert_equal 'DoD Network Information Center', @ipv4.isp
  end

  def test_ipv4_country_code
    assert_equal 'US', @ipv4.code
  end
end
