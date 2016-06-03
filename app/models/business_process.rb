class BusinessProcess < ApplicationRecord
  belongs_to :route
  belongs_to :user
  has_many :tasks
  # has_many :route_points, through: :route
  validates :description, :author_id, :route_id, presence: true
end
