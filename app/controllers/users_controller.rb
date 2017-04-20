class UsersController < ApplicationController
    
    def new
        @user = User.new
    end
    
    def show
       @user = User.find(params[:id])
    end
    
    def create
        # render plain: params[:user].inspect
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "User has been created"
            redirect_to user_path(@user)
        else
           render 'new' 
        end
        
    end
    
    private
    
    def user_params
       params.require(:user).permit(:names, :lastname_1, :lastname_2, :email, :username, :password )
    end
    
end