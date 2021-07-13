class User < ApplicationRecord
    has_secure_password
    has_and_belongs_to_many :parties, :foreign_key => 'host_id'
    has_and_belongs_to_many :parties, :foreign_key => 'guest_id'
    has_many :comments
end
