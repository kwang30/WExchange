class AddProgressTrackerToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :progress, :text
  end
end
