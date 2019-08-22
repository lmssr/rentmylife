class DeleteLifestyleidFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :users, :lifestyle
  end
end
