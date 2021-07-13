class Party < ApplicationRecord
    has_many :guests, :class_name => :User
    has_and_belongs_to_many :hosts, :class_name => :User
    belongs_to :theme
    has_many :comments, through: :parties_comments
end
