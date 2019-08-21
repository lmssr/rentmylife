class AddAdressToLifestyles < ActiveRecord::Migration[5.2]
  def change
    add_column :lifestyles, :adress, :string
  end
end
