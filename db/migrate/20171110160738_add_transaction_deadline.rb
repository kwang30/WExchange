class AddTransactionDeadline < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :deadline, :datetime
  end
end
