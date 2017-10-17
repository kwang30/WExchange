require 'test_helper'

class SignupControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get signup_main_url
    assert_response :success
  end

end
