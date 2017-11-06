class AddRecipientIdToChats < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :recipient_id, :integer
    add_index :chats, :recipient_id
    add_index :chats, [:recipient_id, :sender_id], unique: true # added, think it should go here not SenderId because SenderId migration was made first
  end
end
