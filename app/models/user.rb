class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  
  has_many :parties
  has_many :rsvps, dependent: :destroy
  has_many :comments
  # has_many :parties, through: :comments



  def self.o_auth_find_info(user_info)
    user= find_or_create_by(email: user_info['email']) do |u|
      u.name = user_info['name']
      u.image = user_info['image']
      u.password = SecureRandom.hex
    end 
  end    

  def host_or_guest_account
    self.!params[:user][:admin].empty? ? Host.create(user_params) : Guest.create(user_params)
  end

end
