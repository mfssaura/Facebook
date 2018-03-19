class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: :set_profile_photo

  def show
    @user = User.find(params[:id])
    @feed_items = @user.personal_feed
  end 

  def set_profile_photo
    photo = Photo.find(params[:photo_id])
    user = current_user
    user.profile_photo = photo 
    if user.save
      flash[:notice] = "Profile photo updated!"
      redirect_to root_path
    else
      redirect_to root_path, notice: "Please try again!"
    end 
  end 

  private

    def correct_user
      photo = current_user.photos.find_by(id: params[:photo_id])
      redirect_to root_path if photo.nil?
    end 
end
