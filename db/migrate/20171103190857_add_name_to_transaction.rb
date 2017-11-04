class AddNameToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :transaction_title, :string
  end
end
