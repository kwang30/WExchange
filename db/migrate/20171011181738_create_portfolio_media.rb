class CreatePortfolioMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :portfolio_media do |t|
      t.integer :portfolio_id
      t.string :media_url
      t.string :media_type

      t.timestamps
    end
  end
end
