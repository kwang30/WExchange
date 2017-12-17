class Review < ApplicationRecord
  belongs_to :user
  after_commit :reindex_users



      def reindex_users
        Searchkick::ProcessQueueJob.perform_later(class_name: "User")
      end
end
