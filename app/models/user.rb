class User < ActiveRecord::Base
  validates :username, :presence => true
  validates :email, :presence => true, :uniqueness => true

  has_many :tasks, dependent: :destroy
end