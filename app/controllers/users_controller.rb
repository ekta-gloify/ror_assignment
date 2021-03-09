class UsersController < ApplicationController
    before_filter :user_if_admin
    
    def index
        @users = User.where(role: :author)   
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new        
    end

    def create
        @user = User.new(user_params)
        @user.password = user_password
        @user.password_confirmation = user_password
        if @user.save
            UserMailer.welcome_user(@user,user_password).deliver_now
            redirect_to @user
        else
           render :new
            end 
        end
    end
    
    def edit
        @user = User.find(params[:id])
        
    end

    def update
        @user = User.find(params[:id])
        if @user.update(params[:user].permit(:email,:a_name, :date_of_birth, roles:[]))
           redirect_to @user
        else
           render :edit
        end 
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path     
    end


    private
    def user_params
        params.require(:user).permit(:email,:a_name, :date_of_birth,roles: [])
    end 

    def user_if_admin
        if signed_in?
          redirect_to root_path unless current_user.role == 'admin'
        else
          redirect_to root_path
        end
    end
end  
