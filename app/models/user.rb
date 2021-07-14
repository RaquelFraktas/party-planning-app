class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true

  has_many :parties, through: :users_parties

    has_many :comments
end
