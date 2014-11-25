class Item < ActiveRecord::Base
  belongs_to :house
  belongs_to :room
  belongs_to :category
  has_one :user, through: :house
end
