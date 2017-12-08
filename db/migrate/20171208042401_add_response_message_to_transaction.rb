class AddResponseMessageToTransaction < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :response_message, :string
  end
end
