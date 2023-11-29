class CreateInvitations < ActiveRecord::Migration[7.1]
  def change
    create_table :invitations do |t|
      t.string :uuid
      t.string :product
      t.string :description
      t.decimal :price
      t.string :store_wilaya
      t.string :store_location
      t.string :delivery_type
      t.decimal :local_delivery_price
      t.string :active
      t.integer :delivery_delay_hours
      t.datetime :date
      t.text :images

      t.timestamps
    end
  end
end
