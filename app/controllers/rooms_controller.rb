class RoomsController < ApplicationController
  def create
    @room = current_user.houses.find(params[:room][:house_id]).rooms.new(room_params)
    @room.save
    redirect_to inventory_path
  end

  private
    def room_params
      params.require(:room).permit(:house_id, :name)
    end
end
