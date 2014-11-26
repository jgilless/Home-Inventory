class CategoriesController < ApplicationController
  def create
    @category = current_user.categories.new(category_params) 
    @category.save
    redirect_to houses_path
  end

  def destroy
    @category.destroy
    redirect_to houses_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:user_id, :name)
    end
end
