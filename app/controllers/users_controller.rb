class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create, :index]

  def index 
    if !logged_in?
      redirect_to '/users/new'
    else
      render :show
    end
    #i am creating this view because when i render my error messages, it brings me to a /users path. if i refresh that page then it gives me an error. 
    #i was originally not goig to have an index. 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
        session[:user_id] = @user.id
        render :show
    else
        render :new
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
