# coding: utf-8
require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user =  User.new(first_name: "Brian", last_name: "Sanders", display_name: "brian_sanders", email: "bsanders@gmail.com", password: "123456", password_confirmation: "123456")
  end

  test "should be invalid" do
    assert_not User.new().valid?
  end

  test "should be valid" do
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

#  test "email address and display name should be unique" do
 #   duplicate_user = @user.dup
  #  @user.save
   # assert_not duplicate_user.valid?
  #end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
