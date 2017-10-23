class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :recipient_id
      t.integer :request_id
      t.float :rating
      t.text :text
      t.timestamps
    end
  end
end
