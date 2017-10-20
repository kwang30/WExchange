class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :username
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :display_name
      t.integer :rating
      t.string :biography
      t.string :profile_image_url

      t.timestamps
    end
  end
end
