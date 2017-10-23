class DiscoverController < ApplicationController
  def main
    @users=User.all;
  end

  def index
    @users=User.all;
  end


end
