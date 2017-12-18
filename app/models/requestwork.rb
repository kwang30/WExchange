class Requestwork < ApplicationRecord
  belongs_to :imageable, polymorphic: true, optional: true

    has_attached_file :request_file
    validates_attachment_content_type :request_file, :content_type => /.*/

end
