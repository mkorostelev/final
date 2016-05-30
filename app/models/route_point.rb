class RoutePoint < ApplicationRecord
  belongs_to :route
  has_many :tasks
  validates :number, :description, :route_id, :title, presence: true
  validates :number, numericality: {greater_than_or_equal_to: 1}
  validates :title, length: {minimum: 10}

end
