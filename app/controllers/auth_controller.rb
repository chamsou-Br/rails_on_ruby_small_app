class AuthController < ApplicationController 

    def login
        if request.post?
            puts "Params: #{params.inspect}"
            seller = Seller.find_by(email: params[:email],password: params[:password])  
            puts "sell #{Seller.find_by(email: params[:email])}"
            if seller 
              session[:user_id] = seller.id
              puts "Sucess"
              redirect_to root_path, notice: 'Login successful!'
            else
              puts "Failed"
              flash[:alert] = 'Invalid email or password'
              redirect_to login_path
            end
          end
    end

    def logout 
      session[:user_id] = ""
      redirect_to login_path
    end

end
