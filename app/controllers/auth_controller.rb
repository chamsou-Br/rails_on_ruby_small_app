class AuthController < ApplicationController 

    def login
        if request.post?
            puts "Params: #{params.inspect}"
            seller = Seller.find_by(email: params[:email],password: params[:password])  
            if seller 
              session[:user_id] = seller.id
              puts "Sucess"
              redirect_to root_path, notice: 'Login successful!'
            else
              puts "Failed"
              flash.now.alert = 'Invalid email or password'
            end
          end
    end

end
