class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: categories
  end

  def create
    category = Category.find_or_create_by(name: category_params[:name].downcase)
    if category.valid?
      render json: category
    else
      render json: { errors: category.errors }, status: 401
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
