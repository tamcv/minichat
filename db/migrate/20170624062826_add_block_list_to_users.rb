class AddBlockListToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :block_list, :integer, array: true, default: []
  end
end
