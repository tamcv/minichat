class AddIsReadToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :is_read, :string, :default => false
  end
end
