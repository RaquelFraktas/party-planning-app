class DropUsersPartiesTable < ActiveRecord::Migration[6.1]
  def change
   drop_table :users_parties 
  end
end
