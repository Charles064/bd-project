class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :show, :destroy]
    before_action :require_user
    before_action :require_admin
    
    def index
       @users = User.all 
    end
    
    def new
        @user = User.new
    end
    
    def show
    end
    
    def edit
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
    
    def update
       if @user.update(user_params)
           flash[:notice] = "User has been updated"
           redirect_to user_path(@user)
       else
           render 'edit'
       end
    end
    
    def destroy
       @user.destroy
       flash[:notice] = "User has been deleted"
       redirect_to users_path
    end
    
    private
    
    def user_params
       params.require(:user).permit(:names, :lastname_1, :lastname_2, :email, :username, :password )
    end
    
    def set_user
        @user = User.find(params[:id])
    end
    
    def require_admin
        if !current_user.admin?
            flash[:danger] = "You need admin status to do that!"
            redirect_to root_path
        end 
    end
    
end