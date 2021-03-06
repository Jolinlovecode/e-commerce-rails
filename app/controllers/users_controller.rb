class UsersController < ApplicationController
  def new
  end 

  def create
    if user_params[:password].empty?
      redirect_to new_user_path, alert:"Password shouldn't be blank."
    elsif user_params[:password].length<6
      redirect_to new_user_path, alert:"Password's length have a minimum length eight."
    elsif user_params[:password] !=user_params[:password_confirmation]
      redirect_to new_user_path, alert:"Password does not match."
    elsif User.find_by email:user_params[:email]
      redirect_to new_user_path, alert:"This email has already existed."
    else
      user = User.new(user_params)
      if user.save
        session[:user_id] = user.id
        redirect_to root_path
      else
        redirect_to new_user_path, alert: user.errors.full_messages.first 
      end
    end
  end 

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
