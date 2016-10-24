class User < ActiveRecord::Base
  belongs_to :team
  
  MAJOR = ['CS or EECS declared', 'intended CS or EECS', 'other']
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }, format: VALID_EMAIL_REGEX
  validates :sid, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :password, presence: true, length: {maximum: 50 }
  
  #has_secure_password
  
    
  
    
end