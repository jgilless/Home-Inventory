class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true
  validates :line_1, :city, :state, :zip, :country, presence: true

  def natural
    self.line_1 + ", " + self.city + " " + self.state + ", " + self.zip
  end
end
