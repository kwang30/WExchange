class Portfolio < ApplicationRecord
  belongs_to :user

  has_many  :photos, as: :imageable,  dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :description, presence: true
  acts_as_taggable_on :tags

  after_commit :reindex_users



      def reindex_users
        Searchkick::ProcessQueueJob.perform_later(class_name: "User")
      end
end
