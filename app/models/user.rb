class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true

  has_one :address, as: :addressable, dependent: :destroy, autosave: true
  accepts_nested_attributes_for :address

  has_many :houses
  has_many :rooms, through: :houses
  has_many :categories

  has_many :items, through: :houses

  def name
    self.first_name + " " + self.last_name
  end
end
