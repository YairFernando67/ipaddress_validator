require 'test_helper'

class IpAddressControllerTest < ActionDispatch::IntegrationTest
  test "should get validate" do
    get ip_address_validate_url
    assert_response :success
  end

end
