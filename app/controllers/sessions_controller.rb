class SessionsController < ApplicationController
   
   def new
   
   end
   
   def create
        user = User.find_by(username: params[:session][:username].downcase)
        
        if user && user.authenticate(params[:session][:password]) 
            session[:user_id] = user.id
            flash[:success] = "You are now logged in"
            redirect_to user_base_path(user)
        else
            flash.now[:danger] = "Incorrect User or Password"
            render 'new'
        end
   end
   
   def destroy
       session[:user_id] = nil
       flash[:success] = "You have logged out"
       redirect_to root_path
   end
    
end