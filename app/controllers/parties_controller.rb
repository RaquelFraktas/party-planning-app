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
    @party = Party.new(party_params)
    @party.host = current_user
    @party.save
    #    <%= f.hidden_field :host_id, :value => :current_user %>
    redirect_to party_path(@party)
    
  end
  
  private

  def party_params
    params.require(:party).permit(:name, :capacity, theme_attributes: [:name, :era])
  end


end
