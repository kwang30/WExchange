class SettingsController < ApplicationController
  def index
    @user=User.new

  end

  def edit_user
    @user=User.new
  end

  def edit_notifications
    @user=User.new
  end

  def edit_advanced
    @user=User.new
  end

  def edit_billing
    @user=User.new
  end


end
