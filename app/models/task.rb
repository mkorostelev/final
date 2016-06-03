class Task < ApplicationRecord
  belongs_to :routes
  belongs_to :route_points
  belongs_to :business_processes
  validates :business_process_id, :route_point_id, :route_id, :performer_id, presence: true
end
