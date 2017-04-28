class ClientsController < ApplicationController
    before_action :set_client, only: [:edit, :update, :show, :destroy]
    before_action :require_client, except: [:new, :create]
    before_action :require_same_client, only: [:edit, :destroy]
   
    def index
       @clients = Client.all 
    end
    
    def new
        @client = Client.new
    end
    
    def show
    end
    
    def edit
    end
    
    def create
        # render plain: params[:client].inspect
        @client = Client.new(client_params)
        if @client.save
            session[:client_id] = @client.id
            flash[:notice] = "Account has been created"
            redirect_to client_base_path(@client)
        else
            render 'new' 
        end
        
    end
    
    def update
       if @client.update(client_params)
           flash[:notice] = "Account has been updated"
           redirect_to client_path(@client)
       else
           render 'edit'
       end
    end
    
    def destroy
       @client.destroy
       flash[:notice] = "Account has been deleted"
       redirect_to clients_path
    end
    
    private
    
    def client_params
       params.require(:client).permit(:names, :ln1, :ln2, :email, :u_name, :password, :b_date )
    end
    
    def set_client
       @client = Client.find(params[:id]) 
    end
    
    def require_same_client
        if current_client != @client && !current_user.admin?
            flash[:danger] = "That's not your info!"
            redirect_to root_path
        end
    end
    
end