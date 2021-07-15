module ApplicationHelper


  def facebook_auth(user_info)
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.image = auth['info']['image']
        u.password = SecureRandom.hex
    end    
      session[:user_id] = @user.id
  end  
  #maybe put this in the users model and do self.find_or_create_from type of thing
  #self.find_or_crete_from_facebook(user_info
  #remove uid and just do find or create by email etc. dont need to use uid  
  #user.password= SecureRandom.hex to save a random password since its required in the system
  private
  def auth
    request.env['omniauth.auth']
  end

end
