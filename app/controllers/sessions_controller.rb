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
    @user = User.find_by(email: params[:email]) 
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/home"
    else
      flash.now[:invalid_credentials] = "Invalid Credendtials. Please re-enter your login information."
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to '/'
  end

  def facebook_omniauth
    user_info = auth
    user = Guest.o_auth_find_info(user_info)
    user_session_or_redirect(user)
  end

  def google_omniauth
    user_info = auth
    user = Guest.o_auth_find_info(user_info)
    user_session_or_redirect(user)
  end

  #maybe those routes can be changed to just go through one method?

  protected
  
    def auth
      request.env['omniauth.auth']["info"]
    end

  private 
    def user_session_or_redirect(user)
      if user
        session[:user_id] = user.id
        redirect_to home_path
      else
        redirect_to login_path
      end
    end

end
