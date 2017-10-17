class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.integer :message_id
      t.integer :sender_id
      t.integer :recipient_id
      t.integer :time
      t.string :content

      t.timestamps
    end
  end
end
