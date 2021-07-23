class Comment < ApplicationRecord
  validates_presence_of :content
  validates_presence_of :party_id
  belongs_to :user
  belongs_to :party
end
