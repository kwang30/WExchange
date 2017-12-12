class SettingsController < ApplicationController
  def index
    @user=current_user
  end

  def edit_user
    @user=current_user
  end

  def edit_advanced
    @user=current_user
  end

end
