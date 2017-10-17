class User < ApplicationRecord
    has_one :profile
    has_many :transactions
    has_many :portfolios
    has_many :messages
end
