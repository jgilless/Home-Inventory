class RoomsController < ApplicationController
  def create
    @room = Room.new(room_params)
    @room.save
    redirect_to houses_path
  end

  private
    def room_params
      params.require(:room).permit(:house_id, :name)
    end
end
