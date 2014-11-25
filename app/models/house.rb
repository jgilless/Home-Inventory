class House < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  has_many :rooms
  has_one :address, as: :addressable, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :address
  has_many :items
end