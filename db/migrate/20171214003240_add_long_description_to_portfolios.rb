class AddLongDescriptionToPortfolios < ActiveRecord::Migration[5.1]
  def change
    add_column :portfolios, :long_description, :string
  end
end
