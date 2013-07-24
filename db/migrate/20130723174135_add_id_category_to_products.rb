class AddIdCategoryToProducts < ActiveRecord::Migration
  def change
    add_column :products, :id_category, :integer
  end
end
