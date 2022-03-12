class SessionsController < ApplicationController
  def new
  end 

  def create
    # use user email to find user firstly
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      # if user exists and the input password are correct,save user id inside the brower cookie. 
      # permit them login when they navigate into this website.
      session[:user_id] = user.id
      redirect_to "/"
    else
      # otherwise send new user form back to the user.
      redirect_to '/users/new'
    end
  end 


  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end
