class Party < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :capacity  
  validates_numericality_of :capacity

  belongs_to :host, foreign_key: :user_id
  belongs_to :theme
  has_many :rsvps, dependent: :destroy
  has_many :guests, through: :rsvps, foreign_key: :user_id
  has_many :comments
  has_many :users, through: :comments

  accepts_nested_attributes_for :theme


  def theme_attributes=(theme)
    self.theme = Theme.find_or_create_by(name: theme[:name])
    self.theme.update(theme)
  end


end
