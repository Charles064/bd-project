class OrdersController < ApplicationController
    
    def new
        @order = Order.new
        @products = Product.all
    end
    
    def create
        render plain: params[:order].inspect
    end
end