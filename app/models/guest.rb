class Guest < User
    has_many :parties, through: :users_parties
end