class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ index show update destroy ]
  before_action :authorized

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

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:title)
  end
end
