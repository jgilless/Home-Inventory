class PagesController < ApplicationController
  def home
  end

  def inventory
    @houses = current_user.houses.all
    @rooms = current_user.rooms.all
    @items = current_user.items
    @categories = current_user.categories
  end

  def improvements
  end

  def reports
  end

  def insurance
  end

  def settings
  end
end
