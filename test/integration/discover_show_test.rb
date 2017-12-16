require 'test_helper'

class DiscoverShowTest < ActionDispatch::IntegrationTest
  def setup
    @user =  User.new(first_name: "Brian", last_name: "Sanders", display_name: "brian_sanders", email: "bsanders@gmail.com", password: "123456", password_confirmation: "123456")
  end

  test "show" do
    log_in_as @user
    # get discover_path
    # assert_template 'discover/show'
    #User.all.each {|user| if user.id != @user.id then assert_select 'a[href=?]', user_path(user), text: user.name end}
  end
end
