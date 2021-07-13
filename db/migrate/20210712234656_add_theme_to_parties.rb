class AddThemeToParties < ActiveRecord::Migration[6.1]
  def change
    add_reference :parties, :theme, null: false, foreign_key: true
  end
end
