class ProductsController < ApplicationController
    
    def index
        @all_products = Product.all
    end
    
    def new
        @product = Product.new
    end
    
    def edit
        @product = Product.find(params[:id])
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
        @product = Product.find(params[:id])
        if @product.update(product_params)
            flash[:notice] = "Product Updated"
            redirect_to product_path(@product)
        else
            render 'edit'
        end
    end
    
    def show
        @product = Product.find(params[:id])
    end
    
    def destroy
       @product = Product.find(params[:id]) 
       @product.destroy
       flash[:notice] = "Product has been deleted"
       redirect_to products_path
    end
    
    private
      def product_params
         params.require(:product).permit(:name, :price, :in_stock, :perish, :xp_date)
      end
    
end