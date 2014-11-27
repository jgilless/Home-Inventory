class HousesController < ApplicationController
  before_action :set_house, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @houses = current_user.houses.all
    @rooms = current_user.rooms.all
    @items = current_user.items
    @categories = current_user.categories
    respond_with(@houses)
  end

  def show
    respond_with(@house)
  end

  def new
    @house = current_user.houses.new
    respond_with(@house)
  end

  def edit
  end

  def create
    @house = current_user.houses.new(house_params)
    @house.save
    redirect_to inventory_path
  end

  def update
    @house.update(house_params)
    respond_with(@house)
  end

  def destroy
    @house.destroy
    respond_with(@house)
  end

  private
    def set_house
      @house = House.find(params[:id])
    end

    def house_params
      params.require(:house).permit(:user_id, :name, :address_attributes => [:line_1, :line_2, :number, :city, :zip, :state, :country])
    end
end
