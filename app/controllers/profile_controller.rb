class ProfileController < ApplicationController
  def profile
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def edit
	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def update
	@current_user ||= User.find(session[:user_id]) if session[:user_id]
	@current_user.update(user_params)
	redirect_to profile_path
  end

  def view_profile
    @listing = Listing.find(params[:id])
    @user = User.find(@listing.user_id)
  end
 private

  def user_params
    params.require(:user).permit(:name,
                                 :email, 
                                 :phone_number,
                                 :description,
                                 :home_town,
                                 )
  end

end
