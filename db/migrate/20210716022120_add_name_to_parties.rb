class AddNameToParties < ActiveRecord::Migration[6.1]
  def change
    add_column :parties, :name, :string
  end
end
