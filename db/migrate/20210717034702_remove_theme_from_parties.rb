class RemoveThemeFromParties < ActiveRecord::Migration[6.1]
  def change
    remove_column :parties, :theme, :string
  end
end
