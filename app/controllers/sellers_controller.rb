class SellersController < ApplicationController


      def create 
        puts "parms: #{seller_params}"
        @seller = Seller.find(params[:id])
        @seller.assign_attributes(seller_params)
        if @seller.save
          redirect_to profile_path , notice: 'Seller was successfully updated.'
        else
            flash.now[:alert] = "Erreur lors de la modification de profile"
            render 'pages/profile'
        end
      end
    
      private
    
      def set_seller
        @seller = Seller.find(params[:id])
      end


    
      def seller_params
        params.permit(:id ,:name, :phoneNumber, :email, :firstName, :businessName, :location, :wilaya, :description, :rib)
      end
end
