class Photo < ApplicationRecord
  belongs_to :imageable, polymorphic: true, optional: true

  has_attached_file :image, styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    }

    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes

end
