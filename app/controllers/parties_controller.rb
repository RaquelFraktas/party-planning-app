class PartiesController < ApplicationController

  def index
    @parties = Party.all
  end

  def show
    @party= Party.find(params[:id])
  end

  def new
  end

  def create
    @party = Party.create(party_params)
    redirect_to party_path
  end
  
  private

  def party_params
    params.require(:parties).permit(:name, :theme, :capacity)
  end


end
