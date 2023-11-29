class InvitationsController < ApplicationController
    def show
      @invitation = Invitation.find(params[:id])
    end

    def create

      puts "Params me: #{params.inspect}"

      # Find the seller using the user_id stored in the session
      seller = Seller.find_by(id: session[:user_id])
  
      # Check if all required fields are present and not empty
      if required_fields_present_and_not_empty?
        # Build a new Invitation associated with the found seller
        @invitation = seller.invitations.build(invitation_params)
  
        if @invitation.save
          redirect_to invitations_path, notice: 'Invitation was successfully created.'
        else
          flash.now[:alert] = "Erreur lors de la création de l'invitation."
          render 'pages/newInvitation'
        end
      else
        flash[:alert] = 'Vous devez remplir tous les champs'
        redirect_to new_path
      end
    end
  
    private
  
    def invitation_params
      params.permit(
    :product, :description, :price, :store_wilaya, :store_location,
    :delivery_type, :local_delivery_price, :delivery_delay_hours, :date, :images
  ).merge(seller_id: params[:seller_id])
    end

    def required_fields_present_and_not_empty?
      required_fields = [:product, :description , :price, :store_wilaya, :store_location, :delivery_type, :local_delivery_price, :date , :images]
      
      required_fields.all? { |field| params[field].present? && params[field].strip.present? }
    end
end