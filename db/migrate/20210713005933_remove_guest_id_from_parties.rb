class RemoveGuestIdFromParties < ActiveRecord::Migration[6.1]
  def change
    remove_column :parties, :guest_id, :integer
  end
end
