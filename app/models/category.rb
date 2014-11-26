class Category < ActiveRecord::Base
  validates :name, presence: true
  has_many :items
  belongs_to :user
end
