module PartiesHelper

  def rsvp_button(party)
    if party.guests.count == party.capacity
      "This party is currently at capacity. Check back later to see if any space opens up."
    elsif current_user.type == "Guest" && !party.guests.include?(current_user) 
      render :partial => "rsvp_form", locals: {party: party}
    end
  end

  def remove_rsvp(party, rsvp)
    if party.guests.include?(current_user)
      render partial: "rsvp_delete", locals: {rsvp: rsvp}
    end
  end
end



