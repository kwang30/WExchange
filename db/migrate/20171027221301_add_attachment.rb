class AddAttachment < ActiveRecord::Migration[5.1]
  def change
    add_attachment :photos, :image
  end
end
