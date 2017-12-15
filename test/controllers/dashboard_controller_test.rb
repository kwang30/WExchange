require 'test_helper'

# in order to pass these tests, create a user so you can log in automatically
# then delete that same user so that you can reuse this user in subsequent tests
class DashboardControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:sally)
    log_in_as @user
  end

  test "should get show" do    
    get dashboard_path
    assert_response :success
    assert_template 'dashboard/show'
    assert_select "li.tab", "Incoming Requests"
    assert_select "li.tab", "Outgoing Requests"
    assert_select "div.no-requests", "You have not received any requests yet!"
    assert_select "div.no-requests", "You have not sent any requests yet!"
    assert_select "span.card-title", "Notifications"
    assert_select "div.no-notifications", "No Notifications"
  end

end
