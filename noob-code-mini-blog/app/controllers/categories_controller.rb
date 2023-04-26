class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :authenticate_user!


  # GET /categories
  def index
    categories = Categories::List.new(params).execute

    render json: categories, meta: pagination(categories), each_serializer: CategorySerializer, status: :ok
  end


  # POST /categories
  def create
    @category = Categories::Create.new(category_params).execute

    render json: @category, serializer: CategorySerializer, status: :created
  end

  # PATCH/PUT /categories/1
  def update
    @category.update!(category_params)

    render json: @category, serializer: CategorySerializer, status: :ok
  end

  # DELETE /categories/1
  def destroy
    @category.destroy!
   
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end
end
