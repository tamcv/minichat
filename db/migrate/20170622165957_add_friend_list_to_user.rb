class AddFriendListToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :friend_list, :integer, array: true, default: []
  end
end
