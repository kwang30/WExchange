class CreateRequestworks < ActiveRecord::Migration[5.1]
  def change
    create_table :requestworks do |t|
      t.references :imageable, polymorphic: true, index: true
      t.timestamps
    end

    add_attachment :requestworks, :request_file

  end
end
