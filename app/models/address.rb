class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  validates :line_1, :city, :state, :zip, :country, presence: true
end
