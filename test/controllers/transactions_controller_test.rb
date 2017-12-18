require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user1 = users(:sally)
    @user2 = users(:michael)
    log_in_as @user1
  end

  test "should create transaction" do
    assert_difference 'Transaction.count', 1 do
      post transactions_path, params: { transaction:
                                        {recipient_id: @user2.id,
                                         creator_id: @user1.id,
                                         request_message: "Abstract album cover",
                                         transaction_title: "Cover request",
                                         deadline: "2017-12-18 00:00:00",
                                         status: 0}}
    end
    get dashboard_url
    assert_response :success
    
  end
  
end
