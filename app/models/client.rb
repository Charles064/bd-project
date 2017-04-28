class Client < ActiveRecord::Base
    has_many :orders
    
     before_save { self.u_name = u_name.downcase }
    
    validates   :names, presence: true, length: { minimum: 3, maximum: 100 }
    
    validates   :ln1, presence: true, length: { minimum: 3, maximum: 50 }
    
                VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates   :email, presence: true, uniqueness: { case_sensitive: false }, 
                length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
                
    validates   :u_name, presence: true, uniqueness: { case_sensitive: false }, 
                length: { minimum: 3, maximum: 25 }
                
    has_secure_password
    
    validates   :b_date, presence: true
    
end