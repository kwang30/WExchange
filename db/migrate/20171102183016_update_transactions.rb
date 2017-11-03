class UpdateTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :request_message, :string
  end
end
