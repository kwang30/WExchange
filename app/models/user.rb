class User < ApplicationRecord
has_secure_password
    has_many :transactions
    has_many :portfolios
    has_many :messages
    has_many :reviews
    has_many :photos
    has_many :chats, foreign_key: :sender_id # paul

    before_save { email.downcase! }
    validates :first_name, :last_name,  presence: true, length: {maximum: 50 }
    validates :display_name, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }, on: :create
    has_secure_password

    has_attached_file :image, styles: {
      small: '50X50',
       thumb: '100x100>',
       square: '200x200#',
       medium: '300x300>',
       large: '600x600>'
     }, :default_url => "default.jpeg"

    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
    validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes

    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
end
