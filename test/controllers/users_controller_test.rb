require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get signup" do
    get signup_path
    assert_template 'users/new'
    assert_select "h1.home-form-title", "Sign Up"
    assert_response :success
  end

end
