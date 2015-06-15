class RemoveUserIdFromUrlTable < ActiveRecord::Migration
  def up
    remove_column :urls, :user_id
  end
  def down
    add_column :urls, :user_id, :integer
  end
end
