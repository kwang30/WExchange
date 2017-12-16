class Review < ApplicationRecord
  belongs_to :user
  after_commit :reindex_users


  def reindex_users
    user.reindex
  end
end
