class AddLifestyleToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :lifestyle, foreign_key: true
  end
end
