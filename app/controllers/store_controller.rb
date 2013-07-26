class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @cart = current_cart
  end
  
  def show_filter    
    #@products = Product.find_by_id params[:id_category]
    @products = Product.where("id_category = ?", params[:id])
    if !@products
        redirect_to products_path, :alert => 'Product not found!.'
    end

    @cart = current_cart
  end
  
  
end
