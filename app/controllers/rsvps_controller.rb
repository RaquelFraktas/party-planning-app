class RsvpsController < ApplicationController

    def new
    end

    def create
        current_user.rsvps.build(rsvp_params)
        @party = Party.find(params[:rsvp][:party_id])
        @party.guests << current_user
        redirect_to party_path(@party)
    end

    def destroy
    end

    private

    def rsvp_params
        params.require(:rsvp).permit(:party_id)
    end


end
