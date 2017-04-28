class ClientSessionsController < ApplicationController
   
   def new
   
   end
   
   def create
        client = Client.find_by(u_name: params[:session][:u_name].downcase)
        
        if client && client.authenticate(params[:session][:password]) 
            session[:client_id] = client.id
            flash[:success] = "You are now logged in"
            redirect_to client_base_path(client)
        else
            flash.now[:danger] = "Incorrect User or Password"
            render 'new'
        end
   end
   
   def destroy
       session[:client_id] = nil
       flash[:success] = "You have logged out"
       redirect_to root_path
   end
    
end