class Host < User
    # belongs_to :user
    # has_many_and_belongs_to_many :parties, :foreign_key=> :user_id
    has_many :parties, :foreign_key=> :user_id

end