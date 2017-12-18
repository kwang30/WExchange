class Creatorwork < ApplicationRecord
  belongs_to :imageable, polymorphic: true, optional: true
  has_attached_file :creator_file
  validates_attachment_content_type :creator_file, :content_type => /.*/

end
