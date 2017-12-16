class User < ApplicationRecord
    has_secure_password
    has_many :transactions
    has_many :portfolios
    has_many :messages
    has_many :reviews
    has_many :searches
    has_many :photos
    has_many :notifications, foreign_key: :recipient_id
    has_many :chats, foreign_key: :sender_id # paul
    acts_as_taggable_on :tags

    before_save { email.downcase! }
    validates :first_name, :last_name,  presence: true, length: {maximum: 50 }
    validates :display_name, presence: true, length: {maximum: 50}, uniqueness: { case_sensitive: false }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }, on: :create
    has_secure_password


    has_attached_file :image, styles: {small: '50X50', thumb: '100x100>', square: '200x200#', medium: '300x300>', large: '600x600>'}, :default_url => "default.jpeg"
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
    validates_with AttachmentSizeValidator, attributes: :image, less_than: 5.megabytes
    scope :search_import, -> { includes(:tags) }
    recommends :photos, :portfolios, :users

    searchkick


  def search_data
    {
    first_name: first_name,
    last_name: last_name,
    email: email,
    reviews: reviews.average(:star),
    portfolio_tags: tag_list,
    user_tags: portfolio_tags,
    portfolio_names:portfolio_names,
    portfolio_descriptions:portfolio_descriptions
  }
end

def portfolio_tags
  tags=[]
  for portfolio in portfolios
    for tag in portfolio.tag_list
      tags << tag
    end
  end
end


def portfolio_names
  names=[]
  for portfolio in portfolios
    names << portfolio.name
  end
end

def portfolio_descriptions
  names=[]
  for portfolio in portfolios
    names << portfolio.description
  end
end


  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  end
