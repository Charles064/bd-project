class ClientsController < ApplicationController
   
    def index
       @clients = Client.all 
    end
    
    def new
        @client = Client.new
    end
    
    def show
       @client = Client.find(params[:id])
    end
    
    def edit
        @client = Client.find(params[:id])
    end
    
    def create
        # render plain: params[:client].inspect
        @client = Client.new(client_params)
        if @client.save
            flash[:notice] = "Account has been created"
            redirect_to client_path(@client)
        else
            render 'new' 
        end
        
    end
    
    def update
       @client = Client.find(params[:id]) 
       if @client.update(client_params)
           flash[:notice] = "Account has been updated"
           redirect_to client_path(@client)
       else
           render 'edit'
       end
    end
    
    def destroy
        @client = Client.find(params[:id])
       @client.destroy
       flash[:notice] = "Account has been deleted"
       redirect_to clients_path
    end
    
    private
    
    def client_params
       params.require(:client).permit(:names, :ln1, :ln2, :email, :u_name, :pwd, :b_date )
    end
    
end