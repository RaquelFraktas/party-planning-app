class CreateUsersParties < ActiveRecord::Migration[6.1]
  def change
    create_table :users_parties do |t|
      t.belongs_to :party, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
