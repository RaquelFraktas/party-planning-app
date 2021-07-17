class AddTypeAndAdminToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :type, :string
    add_column :users, :admin, :boolean
  end
end
