class User < ActiveRecord::Base
    
    has_many :order_users
    has_many :orders, through: :order_users
    
    before_save { self.username = username.downcase }
    
    validates   :names, presence: true, length: { minimum: 3, maximum: 100 }
    
    validates   :lastname_1, presence: true, length: { minimum: 3, maximum: 50 }
    
                VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates   :email, presence: true, uniqueness: { case_sensitive: false }, 
                length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
                
    validates   :username, presence: true, uniqueness: { case_sensitive: false }, 
                length: { minimum: 3, maximum: 25 }
                
    validates   :password, presence: true, length: { minimum: 8, maximum: 30 }
    
end