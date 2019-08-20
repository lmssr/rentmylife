class AddUserToLifestyles < ActiveRecord::Migration[5.2]
  def change
    add_reference :lifestyles, :user, foreign_key: true
  end
end
