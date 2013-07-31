class AddProductsBuyToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :products_buy, :string
  end
end
