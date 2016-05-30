class Task < ApplicationRecord
  belongs_to :route
  belongs_to :route_point
  belongs_to :business_process
  validates :business_process_id, :route_point_id, :route_id, :performer_id, presence: true
end
