class Order < ActiveRecord::Base
    belongs_to :client
    
    validates :t_cost, presence: true
    validates :payment, presence: true
    validates :date, presence: true
    
end