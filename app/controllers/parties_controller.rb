class PartiesController < ApplicationController

  def index
    @parties = Party.all
  end

  def show
    @party= Party.find(params[:id])
  end

  def new
    if current_user.type == "Host"
      @party = Party.new
      @party.theme = Theme.new
    else
      #maybe create an alert that says you cannt access the page
      redirect_to parties_path
    end
  end

  def create
    @party = Party.new(party_params)
    @party.host = current_user
    @party.save
    redirect_to party_path(@party)
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private

  def party_params
    params.require(:party).permit(:name, :capacity, theme_attributes: [:name, :era])
  end


end
