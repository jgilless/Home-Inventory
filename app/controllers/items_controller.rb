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
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @item = current_user.items.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.js
    end
  end

  def update
    @item = current_user.items.find(params[:id])
    @item.update(item_params)
    respond_to do |format|
      format.js
    end
  end

  def show
    @item = current_user.items.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def house_items
    @items = current_user.houses.find(params[:house_id]).items
    @house = current_user.houses.find(params[:house_id])
    @house_options = current_user.houses.all.map { |house| [house.name, house.id] }
    @room_options = current_user.rooms.all.map { |room| [room.name, room.id] }
    @category_options = current_user.categories.all.map { |cat| [cat.name, cat.id] }
    respond_to do |format|
      format.js
    end
  end

  def refresh_item
    @house = current_user.houses.find(params[:house_id])
    @houses = current_user.houses.all
    @rooms = current_user.rooms.all
    @categories = current_user.categories
    @house_options = @houses.map { |house| [house.name, house.id] }
    @room_options = @rooms.map { |room| [room.name, room.id] }
    @category_options = @categories.map { |cat| [cat.name, cat.id] }
    respond_to do |format|
      format.js
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:house_id, :room_id, :category_id, :name, :make, :model, :quantity, :place_of_purchase, :purchase_price, :purchase_date, :replacement_price, :serial_number, :bar_code, :image)
    end
end
