require 'test_helper'

# in order to pass these tests, create a user so you can log in automatically
# then delete that same user so that you can reuse this user in subsequent tests
class DashboardControllerTest < ActionDispatch::IntegrationTest  
  test "should get show" do
    @user = User.create(first_name: "Brian", last_name: "Sanders", display_name: "brian_sanders", email: "bsanders@gmail.com", password: "123456", password_confirmation: "123456")
    #puts current_user
    #log_in @user
    #puts current_user

    #puts @user.id
    #puts 'HYE'
    #controller.sessions[:user_id] = @user.id
    #@current_user = User.find_by(id: controller.sessions[:user_id])
    #puts @current_user
    
    get dashboard_url
    assert_response :success
    controller.sessions.delete(:user_id)
    @user.destroy
  end

end
