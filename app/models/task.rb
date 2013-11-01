class Task < ActiveRecord::Base  
  validates :title, presence: true, length: {maximum: 40} 
  validates :content, presence: true, length: {maximum: 140}
end