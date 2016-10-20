class User < ActiveRecord::Base
  attr_accessor :name, :email, :major, :sid, :password, :team

  belongs_to :team
  
  
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: { maximum: 50 }, format: VALID_EMAIL_REGEX
  validates :team, presence: true, length: { maximum: 50 }
  validates :major, presence: true, length: { maximum: 50 }
  validates :sid, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :password, presence: true, length: {maximum: 50 }
  
  #has_secure_password
  
    
    
    
end
