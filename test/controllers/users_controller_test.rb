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

  test "should update user info" do
    @user = users(:sally)
    log_in_as @user
    last, display, email = "Andrews", "socks", "sandrews@gmail.com"
    patch users_path + '/profile', params: { user: {last_name: last} }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_template 'users/show'
  end

  test "should delete user" do
    @user = users(:sally)
    log_in_as @user
    assert_difference 'User.count', -1 do
      post '/delete'
    end
  end

end
