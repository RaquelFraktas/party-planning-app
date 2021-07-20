class Guest < User
    # belongs_to :user
    # has_many :users_parties
    # has_many :parties, through: :users_parties, foreign_key: :user_id
    # has_many :parties, through: :rsvps, foreign_key: :user_id
    has_many :rsvps, :foreign_key=> :user_id, dependent: :destroy
    has_many :parties, through: :rsvps, dependent: :destroy

end