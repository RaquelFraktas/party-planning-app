class Guest < User
  has_many :rsvps, :foreign_key=> :user_id, dependent: :destroy
  has_many :parties, through: :rsvps
  has_many :comments, :foreign_key=> :user_id
end