class AddSellerToInvitations < ActiveRecord::Migration[7.1]
  def change
    add_reference :invitations, :seller, null: false, foreign_key: true
  end
end
