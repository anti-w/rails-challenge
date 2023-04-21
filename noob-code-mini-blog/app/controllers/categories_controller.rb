class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]
  before_action :authenticate_user!


  # GET /categories
  def index
    categories = Categories::List.new(params).execute

    render json: categories, meta: pagination(categories), each_serializer: CategorySerializer, status: :ok
  end

  # GET /categories/1
  def show; end

  # GET /categories/1/edit
  def edit; end

  # POST /categories
  def create
    @category = Categories::Create.new(category_params).execute

    render json: @category, serializer: CategorySerializer, status: :created
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
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
