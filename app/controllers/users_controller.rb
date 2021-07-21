class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create, :index]

  def index 
    if !logged_in?
      redirect_to '/users/new'
    end
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = params[:user][:admin]== "1" ? Host.create(user_params) : Guest.create(user_params)   
    if @user.save
        session[:user_id] = @user.id
        redirect_to "/home"
    else
        render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user= current_user

  end

  def update
    @user= current_user
    @user.update(user_params_for_update)
    if @user.save
      redirect_to home_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.authenticate(params[:password])
      current_user.destroy
      session.clear 
      redirect_to "/"
    else
      #render edit message
      render :edit
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def user_params_for_update
    params.require(params[:type].to_sym.downcase).permit(:name)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
