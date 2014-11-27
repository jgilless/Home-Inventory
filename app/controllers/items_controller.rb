class ItemsController < ApplicationController
  def index
    @items = current_user.items
    respond_to do |format|
      format.html
      format.csv do
        headers['Content-Disposition'] = "attachment; filename=\"item_list.csv\""
        headers['Content-Type'] = 'text/csv'
      end
      format.xls
    end
  end

  def create
    @item = current_user.items.new(item_params)
    @item.save
    redirect_to inventory_path
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    redirect_to inventory_path
  end

  def house_items
    @items = current_user.houses.find(params[:house_id]).items
    @house = current_user.houses.find(params[:house_id])
    respond_to do |format|
      format.js
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:house_id, :room_id, :category_id, :name, :make, :model, :quantity, :place_of_purchase, :purchase_price, :purchase_date, :replacement_price, :serial_number, :bar_code)
    end
end
