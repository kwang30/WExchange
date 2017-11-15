class Transaction < ApplicationRecord
  has_many :users
  serialize :progress
end
