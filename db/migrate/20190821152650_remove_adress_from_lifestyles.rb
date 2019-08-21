class RemoveAdressFromLifestyles < ActiveRecord::Migration[5.2]
  def change
    remove_column :lifestyles, :adress
  end
end
