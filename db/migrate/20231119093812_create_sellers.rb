class CreateSellers < ActiveRecord::Migration[7.1]
  def change
    create_table :sellers do |t|
      t.string :name
      t.string :phoneNumber
      t.string :email
      t.string :firstName
      t.string :businessName
      t.string :location
      t.string :wilaya
      t.string :description
      t.string :status
      t.date :createdAt
      t.string :rib

      t.timestamps
    end
  end
end
