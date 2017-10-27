require 'test_helper'
require 'sessions_helper'

class UserTest < ActiveSupport::TestCase

  include SessionsHelper

  def setup
    @user = User.new(first_name: "Alec", last_name: "Rodgers", email: "user@exaple.com",
                     display_name: "AlecR19", password: "password123", password_confirmation: "password123")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "first name should be present" do
    @user.first_name = "     "
    assert_not @user.valid?
  end

  test "last name should be present" do
    @user.last_name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "display name should be present" do
    @user.display_name = "     "
    assert_not @user.valid?
  end

end
