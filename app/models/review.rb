class Review < ApplicationRecord
  belongs_to :user

  t.text     "body"
  t.float    "rating"
  t.integer  "consumer_id"
  t.integer  "creator_id"
end
