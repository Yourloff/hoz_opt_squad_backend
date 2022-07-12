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

  # DELETE /categories/1
  def destroy
    @subcategory = Subcategory.find(params[:id])
    @subcategory.destroy

    render json: { message: "Удалено" }, status: :ok
  end

  def add_to_basket

  end

  private

  # Only allow a list of trusted parameters through.
  def subcategory_params
    params.require(:subcategory).permit(:title, :image,
                                        :categories_id)
  end
end
