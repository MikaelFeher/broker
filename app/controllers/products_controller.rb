class ProductsController < ApplicationController
  before_action :authenticate_admin_user!, only: [:edit, :update, :create, :new, :destroy]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    if params[:category].blank?
      @products = Product.all.order(created_at: :desc)
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id).order(created_at: :desc)
    end
  end

  def show
  end

  def new
    @product = Product.new
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def edit
    @categories = Category.all.map{ |c| [c.name, c.id] }
  end

  def create
    @product = Product.new(product_params)
    @product.category_id = params[:category_id]
    
    respond_to do |format|
      if @product.save
        format.html { redirect_to root_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @product.category_id = params[:category_id]
    
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to root_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title,
                                      :price,
                                      :address,
                                      :city,
                                      :rooms,
                                      :living_space,
                                      :property_size,
                                      :description,
                                      :build_year,
                                      :ownership_form,
                                      :upkeep,
                                      :category_id)
    end
end
