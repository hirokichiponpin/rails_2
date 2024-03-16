class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :img, :string
    add_column :users, :introduce, :text
  end
end
