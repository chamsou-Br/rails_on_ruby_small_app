class UsersController < ApplicationController
    def index  # GET "users/"
       @users = User.all
     end
   
     def show
       # GET "users/:id"
     end
   
   
     def create 
       @user = User.new(user_params)
     end
   
   
     def update # PATCH "users/:id"
       @user.update(user_params)
     end
   
     def destroy  # DELETE "users/:id"
       @user.destroy
     end
   
end
