class UsersParty < ApplicationRecord
    # belongs_to :user
    belongs_to :guest, :foreign_key=> :user_id
    # belongs_to :host, :foreign_key=> :user_id
    belongs_to :party
  end