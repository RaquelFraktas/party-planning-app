class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP } 
  
  has_many :user_parties
  has_many :comments

  # before_save :is_host

  def self.o_auth_find_info(user_info)
    user= find_or_create_by(email: user_info['email']) do |u|
      u.name = user_info['name']
      u.image = user_info['image']
      u.password = SecureRandom.hex
    end 
  end    

  # def is_host
  #   self.admin ? self.type == Host : self.type == Guest
  # end

end
