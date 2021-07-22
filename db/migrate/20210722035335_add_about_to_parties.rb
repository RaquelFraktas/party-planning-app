class AddAboutToParties < ActiveRecord::Migration[6.1]
  def change
    add_column :parties, :about, :text
  end
end
