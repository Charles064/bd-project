class ProductsController < ApplicationController
    
    before_action :set_prod, only: [:edit, :update, :show, :destroy]
    
    
    def index
        @all_products = Product.all
    end
    
    def new
        @product = Product.new
    end
    
    def edit
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
    
    def update
        if @product.update(product_params)
            flash[:notice] = "Product Updated"
            redirect_to product_path(@product)
        else
            render 'edit'
        end
    end
    
    def show
    end
    
    def destroy
       @product.destroy
       flash[:notice] = "Product has been deleted"
       redirect_to products_path
    end
    
    private
      def set_prod
        @product = Product.find(params[:id])
      end
      
      def product_params
         params.require(:product).permit(:name, :price, :in_stock, :perish, :xp_date)
      end
    
end