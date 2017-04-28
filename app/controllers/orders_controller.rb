class OrdersController < ApplicationController
    
    def index
        @order = Order.all
    end
    
    def new
        @order = Order.new
        @products = Product.all
    end
    
    def create
        render plain: params[:order].inspect
    end
    
    def show
        @order = Order.find(params[:id])
    end
    
end