class Party < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :capacity  

  has_many :users_parties
  has_many :users, through: :users_parties
  belongs_to :theme
  has_many :comments, through: :parties_comments

  def theme_name=(name)
    self.theme = Theme.find_or_create_by(name: name)
  end

  def theme_name
     self.theme ? self.theme.name : nil
  end

end
