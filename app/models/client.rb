class Client < ActiveRecord::Base
    has_many :orders
    
    validates   :names, presence: true, length: { minimum: 3, maximum: 100 }
    
    validates   :ln1, presence: true, length: { minimum: 3, maximum: 50 }
    
    validates   :ln2, presence: true, length: { minimum: 3, maximum: 50 }
    
                VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates   :email, presence: true, uniqueness: { case_sensitive: false }, 
                length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
                
    validates   :u_name, presence: true, uniqueness: { case_sensitive: false }, 
                length: { minimum: 3, maximum: 25 }
                
    validates   :pwd, presence: true, length: { minimum: 8, maximum: 30 }
    
    validates   :b_date, presence: true
    
end