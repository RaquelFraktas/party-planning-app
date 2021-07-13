class CreatePartiesComments < ActiveRecord::Migration[6.1]
  def change
    create_table :parties_comments do |t|
      t.belongs_to :parties, null: false, foreign_key: true
      t.belongs_to :comments, null: false, foreign_key: true

      t.timestamps
    end
  end
end
