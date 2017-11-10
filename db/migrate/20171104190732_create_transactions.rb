class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :recipient_id
      t.integer :creator_id
      t.string :request_message
      t.string :transaction_title
      t.timestamps
    end
  end
end
