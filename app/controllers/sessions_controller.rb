class SessionsController < ApplicationController
  def new
  end 

  def create
    user = User.find_by_email(params[:email])
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # if user email exists and the password matches,save user id inside the brower cookie. 
      # permit them login when they navigate into this website.
      session[:user_id] = user.id
      redirect_to root_path
    else
      # otherwise send new user form back to the user.
      redirect_to new_session_path,alert:"Password or email is not correct. Try again!"
    end
  end 


  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
