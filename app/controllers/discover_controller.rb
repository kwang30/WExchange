class DiscoverController < ApplicationController
  def show
    if (params[:search_query].nil? || params[:search_query].empty?) && params[:filtertype].nil? && params[:reviews].nil?
      @users=current_user.similar_raters
   else
      query=params[:search_query] || "*"
      if !params[:filtertype].nil? || params[:filtertype]=="Both"
        users1 = User.search(params[:search_query], fields: [:first_name, :last_name, :display_name, :user_tags],  match: :word_start, operator: "or")
        users2=User.search(params[:search_query], fields: [:portfolio_names, :portfolio_tags])
        @users=users1 || users2
      elsif params[:filtertype]=="Portfolio"
        @users=User.search(params[:search_query], fields: [:portfolio_names, :portfolio_tags], match: :word_start, operator: "and")
      elsif params[:filtertype]=="User"
        @users= User.search(params[:search_query], fields: [:first_name, :last_name, :display_name, :user_tags],  match: :word_start, operator: "and")
      end
      puts @users.size
    end

    respond_to do |format|
       format.html
       format.js
    end


  end

  def index
    render 'main'
  end



end
