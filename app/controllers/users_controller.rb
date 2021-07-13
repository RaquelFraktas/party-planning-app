class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new]

  def index
  end

  def new
    @user = User.new
    #maybe i dont this
  end

  def create
    @user = User.create(user_params)
    if @user
        session[:user_id] = params[:user_id]
    else
        redirect_to "new"
    end
  end

  def show
  end

  private
  
  def user_params
    params.require(:users).permit(:email, :password, :password_confirmation)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
