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
    #we render a form_tag instead of a form_for while logging in because we are not saving it to the database
  end

  def destroy
    session.destroy
    redirect_to '/'
  end

end
