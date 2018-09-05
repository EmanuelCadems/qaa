module CapybaraHelper
  def basic_auth!
    encoded_login = ["#{ENV['USERNAME']}:#{ENV['PASSWORD']}"].pack("m*")
    page.driver.header 'Authorization', "Basic #{encoded_login}"
  end
end
