class AddAttachmentPhotoToMessages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :messages do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :messages, :photo
  end
end
