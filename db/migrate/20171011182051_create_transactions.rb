class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :transaction_id
      t.boolean :negotiate
      t.integer :creator_id
      t.integer :recipient_id
      t.string :creation_date
      t.string :completion_date
      t.decimal :amount, :precision =>6, :scale =>2
      t.string :status
      t.integer :rating

      t.timestamps
    end
  end
end
