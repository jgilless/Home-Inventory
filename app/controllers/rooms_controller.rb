class RoomsController < ApplicationController
  def create
    @room = current_user.houses.find(params[:house_id]).new(room_params)
    @room.save
    redirect_to inventory_path
  end

  private
    def room_params
      params.require(:room).permit(:house_id, :name)
    end
end
