class CreateParties < ActiveRecord::Migration[6.1]
  def change
    create_table :parties do |t|
      t.integer :theme
      t.integer :capacity

      t.timestamps
    end
  end
end
