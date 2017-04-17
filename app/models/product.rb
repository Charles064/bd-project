class Product < ActiveRecord::Base
    validates :name, presence: true, length: { minimum: 3, maximum: 20}
    validates :price, presence: true
    validates :in_stock, presence: true
    
end