class CategoriesController < ApplicationController
  # POST /categories
  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # GET /categories/1
  def show
    render json: @category
  end

  # GET /categories
  def index
    @categories = Category.all
    render json: @categories
  end

  # DELETE /subcategories/1
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    render json: { message: "Удалено" }, status: :ok
  end

  private

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:title)
  end
end
