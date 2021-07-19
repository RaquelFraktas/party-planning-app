class Party < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :capacity  

  belongs_to :host, foreign_key: :user_id

  has_many :users_parties
  has_many :guests, through: :users_parties
 
  
  belongs_to :theme
  # has_many :comments, through: :parties_comments

  accepts_nested_attributes_for :theme

  def theme_attributes=(theme)
    self.theme = Theme.find_or_create_by(name: theme[:name])
    self.theme.update(theme)
  end

  # def theme_name=(name)
  #   self.theme = Theme.find_or_create_by(name: name)
  # end

  # def theme_name
  #    self.theme ? self.theme.name : nil
  # end

  # def self.party_admin
  #   user = find(session[:user_id])
  #   if user.admin
  #     self.users.host
  #   end
  # end

end
