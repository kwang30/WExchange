class User < ApplicationRecord
has_secure_password
    has_one :profile
    has_many :transactions
    has_many :portfolios
    has_many :messages

    before_save { self.email = email.downcase }
    before_save { self.username = email.username }


    validates :name,  presence: true, length: {maximum: 50 },
    uniqueness: { case_sensitive: false }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+\.[edu]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { minimum: 6 }

    def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
