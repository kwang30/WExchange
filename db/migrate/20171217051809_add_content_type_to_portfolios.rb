class AddContentTypeToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :content_type, :string
  end
end
