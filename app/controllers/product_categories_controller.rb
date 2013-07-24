class ProductCategoriesController < ApplicationController
  
    def index
      @product_categories = ProductCategory.all
    end
    
    def new
      @product_categories = ProductCategory.new
      
      respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_categories }
    end
    end

  # GET /products/1/edit
    def edit
      @product_categories = ProductCategory.find(params[:id])
    end

  # POST /products
  # POST /products.json
  def create
    @product_categories = ProductCategory.new(params[:product_category])

    respond_to do |format|
      if @product_categories.save
        format.html { redirect_to  product_categories_url, notice: 'Product_category was successfully created.' }
        format.json { render json:  @product_categories, status: :created, location:  @product_categories }
      else
        format.html { render action: "new" }
        format.json { render json:  @product_categories.errors, status: :unprocessable_entity }
      end
    end
  end
  


  # PUT /products/1
  # PUT /products/1.json
  def update
    @product_categories = ProductCategory.find(params[:id])

    respond_to do |format|
      if @product_categories.update_attributes(params[:product_category])
        format.html { redirect_to product_categories_url, notice: 'Product_category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json:  @product_categories.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
     @product_categories = ProductCategory.find(params[:id])
     @product_categories.destroy

    respond_to do |format|
      format.html { redirect_to product_categories_url }
      format.json { head :no_content }
    end
  end
end
