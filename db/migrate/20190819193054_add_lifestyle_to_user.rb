class AddLifestyleToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :lifestyle, foreign_key: true
  end
end
