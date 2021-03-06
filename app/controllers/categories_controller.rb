class CategoriesController < ApplicationController
  def create
    @category = current_user.categories.new(category_params) 
    @category.save
    redirect_to refresh_item_path(:house_id => current_user.houses.first.id)
  end

  def destroy
    @category.destroy
    redirect_to inventory_path
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:user_id, :name)
    end
end
