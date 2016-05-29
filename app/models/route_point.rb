class RoutePoint < ApplicationRecord
  belongs_to :route
  validates :number, :description, :route_id, presence: true
end
