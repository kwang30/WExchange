class AddAttachmentRequestFileToRequestworks < ActiveRecord::Migration[5.1]
  def self.up
    change_table :requestworks do |t|
      t.attachment :request_file
    end
  end

  def self.down
    remove_attachment :requestworks, :request_file
  end
end
