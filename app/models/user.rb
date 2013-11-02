class User < ActiveRecord::Base
  validates :username, :presence => true, length: { maximum: 10, minimum: 3 }, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true

  has_many :tasks, dependent: :destroy

  has_secure_password    
  validates :password, length: {minimum:6, }

  
end