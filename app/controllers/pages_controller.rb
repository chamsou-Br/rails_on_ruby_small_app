class PagesController < ApplicationController
  def home
    @transaction_status_list = [
      {
      title: "Encaissé",
      value: 80,
      color: "44F2A1",
      icon: "fa-solid fa-rectangle-xmark"
    },
    {
      title: "En attente",
      value: 80,
      color: "EEE745",
      icon: "fa-solid fa-circle-pause",
    },
    {
      title: "Annulé",
      value: 80,
      color: "EE4563",
      icon: "fa-solid fa-square-check",
    },
    {
      title: "Verrouillé",
      value: 80,
      color: "0019FF",
      icon: "fa-solid fa-comments-dollar",
    },
    {
      title: "Ce mois",
      value: 80,
      color: "6D6D6D",
      icon: "fa-solid fa-calendar-days",
    },
    ]
    @test =  "Your iPhone 12, iPhone 12 mini, iPhone 12 Pro, or iPhone 12 Pro Max works with the 5G networks of certain carriers. Learn more about 5G. Add and view widgets"
    @invitations = Invitation.all
  end

  def login
  end

  def register
  end

  def invitations
    @invitations = Invitation.all

    puts "inv "
    all_invitations = Invitation.all

    # Print the length of the invitations
    puts "Number of Invitations: #{all_invitations.length}"
  end

  def invitationsSearch
    @invitations = Invitation.search_by_default(params[:id]).records.to_a

    puts "inv "
    all_invitations = @invitations

    # Print the length of the invitations
    puts "Number of Invitations: #{all_invitations.length}"
  end

  def newInvitation
  
  end

  def invitationDetail
    @invitation = Invitation.find_by(id: params[:id])
    if @invitation.nil?
      redirect_to '/invitations'
    end
    
    @transactions = Transaction.where(invitation_id: params[:id])
    
  end

  def transactions
  end

  def profile
  @seller = Seller.find(session[:user_id])
  end
end
