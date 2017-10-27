require 'test_helper'

class DiscoverControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get discover_path
    assert_response :success
  end

end
