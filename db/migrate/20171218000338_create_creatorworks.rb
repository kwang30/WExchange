class CreateCreatorworks < ActiveRecord::Migration[5.1]
  def change
    create_table :creatorworks do |t|
      t.references :imageable, polymorphic: true, index: true
      t.timestamps
    end


    add_attachment :creatorworks, :creator_file


  end
end
