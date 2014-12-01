class RoomsController < ApplicationController
  def create
    @room = current_user.houses.find(params[:room][:house_id]).rooms.new(room_params)
    @room.save
    redirect_to refresh_item_path(:house_id => @room.house.id)
  end

  private
    def room_params
      params.require(:room).permit(:house_id, :name)
    end
end
