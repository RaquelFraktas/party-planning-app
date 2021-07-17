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
    @party = Party.create(party_params)
    redirect_to party_path(@party)
  end
  
  private

  def party_params
    params.require(:party).permit(:name, :theme_name, :capacity, :user)
  end


end
