class AddPasswordToSellers < ActiveRecord::Migration[7.1]
  def change
    add_column :sellers, :password, :string
  end
end
