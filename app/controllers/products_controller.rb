class ProductsController < ApplicationController
  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  def show
    @product = Product.find(params[:id])
    render json: @product
  end

  # POST /products
  def create
    @product = Product.create(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    @product = Product.find(product_params[:id])

    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end

  end

  # DELETE /products/1
  def destroy
    @product = Product.find(product_params[:id])
    @product.destroy
  end

  private

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:id, :article_number, :title,
                                    :price, :image, :subcategories_id, :is_available?)
  end
end
