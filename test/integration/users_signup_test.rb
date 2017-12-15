require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid info should not complete signup" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { first_name:  "",
                                         last_name: "",
                                         display_name: "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { first_name:  "Brave",
                                         last_name: "Braveheart",
                                         display_name: "braveheart",
                                         email: "braveheart@gmail.com",
                                         password:              "123456",
                                         password_confirmation: "123456" } }
    end
    #follow_redirect!
    #assert_template 'dashboard/show' # current_user is nil
  end
end
