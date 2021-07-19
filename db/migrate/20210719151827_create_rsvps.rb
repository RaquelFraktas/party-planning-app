class CreateRsvps < ActiveRecord::Migration[6.1]
  def change
    create_table :rsvps do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
