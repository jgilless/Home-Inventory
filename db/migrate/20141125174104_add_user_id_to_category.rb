class AddUserIdToCategory < ActiveRecord::Migration
  def change
    reversible do |dir|
      dir.up { add_column :categories, :user_id, :integer }
      dir.down { remove_column :categories, :user_id, :integer }
    end
  end
end
