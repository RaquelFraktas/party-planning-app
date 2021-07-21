class Host < User
  has_many :parties, :foreign_key=> :user_id, dependent: :destroy
  has_many :comments, :foreign_key=> :user_id, dependent: :destroy
end