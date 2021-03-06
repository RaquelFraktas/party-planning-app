class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates :password, length: {minimum: 8, allow_nil: true}
  
  has_many :rsvps, dependent: :destroy
  has_many :comments, dependent: :destroy

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
