class AddAddressToLifestyles < ActiveRecord::Migration[5.2]
  def change
    add_column :lifestyles, :address, :string
  end
end
