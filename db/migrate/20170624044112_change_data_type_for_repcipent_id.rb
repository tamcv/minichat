class ChangeDataTypeForRepcipentId < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :recipient_ids, :integer, array: true, default: []
  end
end