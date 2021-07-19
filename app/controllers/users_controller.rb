class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create, :index]

  def index 
    if !logged_in?
      redirect_to '/users/new'
    end
    @user = current_user
    #i am creating this view because when i render my error messages, it brings me to a /users path. if i refresh that page then it gives me an error. 
    #i was originally not goig to have an index. 
  end

  def new
    @user = User.new
  end

  def create
    @user = !params[:user][:admin].empty? ? Host.create(user_params) : Guest.create(user_params)
    # @user= User.create(user_params)
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
    if @user.save 
      @user.update(user_params_for_update)
      redirect_to home_path
    else
      render :new
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def user_params_for_update
    case current_user.type
    when "host"
      params.require(:host).permit(:name, :email, :password, :password_confirmation, :admin)
    when "guest"
      params.require(:guest).permit(:name, :email, :password, :password_confirmation, :admin)
    end
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end

end
