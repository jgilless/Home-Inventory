class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :address, as: :addressable, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :address

  has_many :houses
  has_many :categories

  has_many :items, through: :houses
end
