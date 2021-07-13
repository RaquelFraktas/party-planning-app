class Comment < ApplicationRecord
  belongs_to :users
  has_many :parties, through: :parties_comments
end
