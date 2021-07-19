class Guest < User
    # belongs_to :user
    has_many :users_parties
    has_many :parties, through: :users_parties, foreign_key: :user_id
end