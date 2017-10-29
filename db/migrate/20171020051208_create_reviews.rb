class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :star, default: 1
      t.text :text
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
