class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]
  
  def home
    @user = current_user
    @feed_items = current_user.feed
  end 
end
