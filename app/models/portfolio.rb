class Portfolio < ApplicationRecord
  belongs_to :user

  has_many  :photos, as: :imageable,  dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  accepts_nested_attributes_for :photos, allow_destroy: true

end
