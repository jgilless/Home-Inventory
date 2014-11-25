class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :category_id
      t.integer :room_id
      t.integer :house_id
      t.string :name
      t.string :make
      t.string :model
      t.integer :quantity
      t.string :place_of_purchase
      t.decimal :purchase_price, :precision => 8, :scale => 2
      t.date :purchase_date
      t.decimal :replacement_price, :precision => 8, :scale => 2
      t.string :serial_number
      t.integer :bar_code
      t.timestamps
    end
  end
end
