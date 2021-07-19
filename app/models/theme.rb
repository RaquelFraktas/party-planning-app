class Theme < ApplicationRecord
  validates_presence_of :name
  has_many :parties
end
