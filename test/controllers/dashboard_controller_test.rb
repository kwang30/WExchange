require 'test_helper'
require_relative 'sessions_helper'

# in order to pass these tests, create a user so you can log in automatically
# then delete that same user so that you can reuse this user in subsequent tests
class DashboardControllerTest < ActionDispatch::IntegrationTest  
  test "should get show" do
    @user = User.create(first_name: "Brian", last_name: "Sanders", display_name: "brian_sanders", email: "bsanders@gmail.com", password: "123456", password_confirmation: "123456")
    get dashboard_url
    assert_response :success
    @user.destroy
  end

end
