require 'test_helper'

class SettingsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:sally)
    log_in_as @user
  end

  test "should get settings page" do
    get settings_path
    assert_response :success
    assert_template "settings/index"
  end

  test "should get account page" do
    get settings_path + '/profile'
    assert_response :success
    assert_template "settings/edit_user"
  end

  test "check settings page contents" do
    get settings_path
    assert_select "a[href=?]", settings_path + '/profile'
    assert_select "a[href=?]", settings_path + '/advanced'
  end
  
end
