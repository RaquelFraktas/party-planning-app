class PartiesController < ApplicationController

  def index
    @parties = Party.all
  end

  def show
    @party= Party.find(params[:id])
    @rsvp = current_user_rsvp(@party)
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
    @party= Party.find(params[:id])
    if !current_user == @party.host
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @party= Party.find(params[:id])
    @party.update(party_params)
    if @party.save
      redirect_to party_path
    else
      render :edit
    end
  end

  def destroy
    party = Party.find(params[:id])
    party.destroy
    redirect_to parties_path
  end
  
  private

  def party_params
    params.require(:party).permit(:name, :capacity, theme_attributes: [:name, :era])
  end

  def current_user_rsvp(party)
    current_user.rsvp_ids.each do|id|
      if id == party.rsvp_ids
        id
      end
    end
  end

end
