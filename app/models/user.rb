class User < ActiveRecord::Base
  validates :username, :presence => true, length: { maximum: 50, minimum: 2 }, uniqueness: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true


  has_secure_password    
  validates :password, length: {minimum:6, }

  # 与Tasks任务的关系
  has_many :tasks, dependent: :destroy
  
  # 与Projects项目的关系
  belongs_to :project
end