class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :image
      t.string :roomname
      t.text :introduce
      t.integer :price

      t.timestamps
    end
  end
end
