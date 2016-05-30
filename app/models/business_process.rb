class BusinessProcess < ApplicationRecord
  belongs_to :route
  # has_many :route_points, through: :route
  validates :description, :author_id, :route_id, presence: true
end
