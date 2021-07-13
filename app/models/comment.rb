class Comment < ApplicationRecord
  validates_presence_of :content
  belongs_to :users
  has_many :parties, through: :parties_comments
end
