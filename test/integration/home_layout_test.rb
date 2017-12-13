require 'test_helper'

class HomeLayoutTest < ActionDispatch::IntegrationTest
  test "logged out layout links" do
    get root_path
    assert_template 'home/show'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path
  end

  test "home layout" do
    get root_path
    assert_select "div.home-header", "WExchange"
    assert_select "div.input-field", "search"
  end
  
end
