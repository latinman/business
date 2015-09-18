class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create]

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save!
      flash[:success] = "Product created!"
      redirect_to products_path
    else
      flash[:danger] = "Error creating this product"
      redirect_to new_product_path
    end
  end

  def edit
  end

  def update

    if @product.update(product_params)
      flash[:success] = "Product updated!"
      redirect_to products_path
    else
      flash[:danger] = "Error updating product"
      redirect_to "edit"
    end
  end

  def destroy

    if @product.destroy
      flash[:success] = "Deleted product"
      redirect_to root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end