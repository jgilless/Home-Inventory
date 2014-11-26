class Room < ActiveRecord::Base
  belongs_to :house
  has_one :user, through: :house
  has_many :items
end
