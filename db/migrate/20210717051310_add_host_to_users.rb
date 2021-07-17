class AddHostToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :host, :boolean
  end
end
