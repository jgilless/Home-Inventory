class PagesController < ApplicationController
  before_action :authenticate_user!, except: :home
  def home
  end

  def inventory
    @houses = current_user.houses.all
    @rooms = current_user.rooms.all
    #@items = current_user.items
    @categories = current_user.categories
    @house_options = @houses.map { |house| [house.name, house.id] }
    @room_options = @rooms.map { |room| [room.name, room.id] }
    @category_options = @categories.map { |cat| [cat.name, cat.id] }
  end

  def improvements
  end

  def settings
  end
end
