class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.string :uuid
      t.string :delivery_place
      t.string :delivery_type
      t.decimal :delivery_price
      t.datetime :delivery_date
      t.string :state
      t.string :outcome
      t.string :activation_key
      t.datetime :payment_date
      t.boolean :certified_delivery
      t.string :certified_company
      t.references :invitation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
