class SessionsController < ApplicationController

  def index
    if session[:user_id]
      redirect_to "/home"
    else
      render :index
    end
  end

  def new
    
  end  

  def create
  end

  def destroy
    session.destroy
    redirect_to '/'
  end

end
