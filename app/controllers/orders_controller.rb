class OrdersController < ApplicationController
    
    before_action :require_user
    
    def index
        @order = Order.all
    end
    
    def new
        @order = Order.new
        @products = Product.all
    end
    
    def create
        render plain: params[:order].inspect
        @order.user = current_user
        
    end
    
    def show
        @order = Order.find(params[:id])
        
    end
    
end