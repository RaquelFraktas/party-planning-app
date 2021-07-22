class Theme < ApplicationRecord
  validates_presence_of :name
  has_many :parties
  # scope :search_for_theme, ->(name){where("name LIKE ?", "%{name%}")}

end
