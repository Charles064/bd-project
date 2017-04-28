class WelcomeController < ApplicationController
   
   def home
       redirect_to user_base_path if user_logged_in?
       redirect_to client_base_path if client_logged_in?
   end
   
   def about
       
   end
    
end