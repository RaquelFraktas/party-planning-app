class PartiesController < ApplicationController

  def index
    @parties = Party.all
  end

  def show
    @party= Party.find(params[:id])
  end

  def new
    @party = Party.new
  end

  def create
    user = User.find(session[:user_id])
    if user.admin
      @party = Party.create(party_params)
      byebug
      redirect_to party_path(@party)
    else
    end
    
  end
  
  private

  def party_params
    params.require(:party).permit(:name, :theme_name, :capacity, :user)
  end


end
