class SessionsController < ApplicationController

  def index
    if session[:user_id]
      redirect_to "/home"
    else
      render :index
    end
  end

  def new
    @user = User.new
  end  

  def create
    @user = User.find_by(email: params[:email]) unless facebook_auth
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/home"
    else
      flash.now[:invalid_credentials] = "Invalid Credendtials. Please re-enter your login information."
      render :new
    end
    #we render a form_tag instead of a form_for while logging in because we are not saving it to the database
  end

  def destroy
    session.destroy
    redirect_to '/'
  end

  def facebook_omniauth
    # byebug
    user = helpers.facebook_auth(user_info)
    if user
      session[:user_id] = user.id
      redirect_to home_path
    else
      #add a flash error if the user already is in the system and prompt them to log in instead
      redirect_to login_path
    end
  end

  def google_omniauth
  end

end
