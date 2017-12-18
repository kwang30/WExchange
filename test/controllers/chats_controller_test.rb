require 'test_helper'

class ChatsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user1 = users(:sally)
    @user2 = users(:michael)
    log_in_as @user1
  end

  test "should get chats" do
    get chats_url
    assert_response :success
    assert_template 'chats/index'    
  end

end

  
