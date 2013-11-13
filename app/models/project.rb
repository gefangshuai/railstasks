class Project < ActiveRecord::Base
  default_scope :order => 'created_at'
  # 与Users用户关系
  has_many :users
end
