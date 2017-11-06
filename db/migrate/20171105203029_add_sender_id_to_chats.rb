class AddSenderIdToChats < ActiveRecord::Migration[5.1]
  def change
    add_column :chats, :sender_id, :integer
    add_index :chats, :sender_id
  end
end
