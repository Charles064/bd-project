class ProductsController < ApplicationController
    
    def new
        @product = Product.new
    end
    
    def create
        @product = Product.new(product_params)
        if @product.save
           flash[:notice] = "Product has been added"
           redirect_to product_path(@product) 
        else
            render 'new'    
        end
    end
    
    def show
        @product = Product.find(params[:id])
    end
    
    private
      def product_params
         params.require(:product).permit(:name, :price, :in_stock, :perish, :xp_date)
      end
    
end