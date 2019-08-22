class AddCoordinatesToLifestyles < ActiveRecord::Migration[5.2]
  def change
    add_column :lifestyles, :latitude, :float
    add_column :lifestyles, :longitude, :float
  end
end
