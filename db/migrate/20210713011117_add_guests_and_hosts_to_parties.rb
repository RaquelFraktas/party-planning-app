class AddGuestsAndHostsToParties < ActiveRecord::Migration[6.1]
  def change
    add_reference :parties, :guest, null: false, foreign_key: true
    add_reference :parties, :host, null: false, foreign_key: true
  end
end
