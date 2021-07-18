class PartiesController < ApplicationController

  def index
    @parties = Party.all
  end

  def show
    @party= Party.find(params[:id])
  end

  def new
    @party = Party.new
    @party.theme = Theme.new
  end

  def create
    #throw in admin acccess only to creat method somewhere.
    # user = User.find(session[:user_id])
      @party = Party.create(party_params)
      byebug
      redirect_to party_path(@party)
    
  end
  
  private

  def party_params
    params.require(:party).permit(:name, :capacity, theme_attributes: [:name, :era])
  end


end
