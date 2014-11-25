class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :line_1
      t.string :line_2
      t.string :number
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.integer :addressable_id
      t.string :addressable_type
      t.timestamps
    end
  end
end
