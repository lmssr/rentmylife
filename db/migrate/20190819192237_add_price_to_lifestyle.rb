class AddPriceToLifestyle < ActiveRecord::Migration[5.2]
  def change
    add_column :lifestyles, :price, :integer
  end
end
