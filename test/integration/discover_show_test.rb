require 'test_helper'

class DiscoverShowTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:sally)
  end

  test "show" do
    log_in_as @user
    get discover_path
    assert_template 'discover/show'
    #User.all.each {|user| if user.id != @user.id then assert_select 'a[href=?]', user_path(user), text: user.name end}
  end
end
