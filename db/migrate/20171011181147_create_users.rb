class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :display_name
      t.string :email
      t.string :creator_type

      t.integer :rating
      t.string :phone_number
      t.string :biography
      t.timestamps
    end
    add_index :users, :email,  unique: true
    add_index :users, :display_name,  unique: true
  end
end
