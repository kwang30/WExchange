class Transaction < ApplicationRecord
  has_many :users
  serialize :progress

  has_many  :requestworks, as: :imageable,  dependent: :destroy
  has_many  :creatorworks, as: :imageable,  dependent: :destroy

  has_many  :requestworks, as: :imageable,  dependent: :destroy
  accepts_nested_attributes_for :requestworks, allow_destroy: true

  has_many  :creatorworks, as: :imageable,  dependent: :destroy
  accepts_nested_attributes_for :creatorworks, allow_destroy: true


end
