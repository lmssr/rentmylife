class AddPhotoToLifestyles < ActiveRecord::Migration[5.2]
  def change
    add_column :lifestyles, :photo, :string
  end
end
