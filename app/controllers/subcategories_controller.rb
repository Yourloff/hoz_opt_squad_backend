class SubcategoriesController < ApplicationController
  # POST /subcategories
  def create
    @subcategory = Subcategory.new(subcategory_params)

    if @subcategory.save
      render json: @subcategory, status: :created, location: @subcategory
    else
      render json: @subcategory.errors, status: :unprocessable_entity
    end
  end

  # GET /subcategories
  def index
    @subcategories = Subcategory.all
    render json: @subcategories
  end

  # GET /categories/1
  def show
    render json: @subcategory
  end

  private

  # Only allow a list of trusted parameters through.
  def subcategory_params
    params.require(:subcategory).permit(:title, :image,
                                        :categories_id)
  end
end
