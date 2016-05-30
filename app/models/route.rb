class Route < ApplicationRecord
  has_many :route_points, dependent: :destroy
  has_many :business_processes
  has_many :tasks
  validates :title, :description, :author, presence: true
  validates :title, uniqueness: true
  validates :title, length: { minimum: 3 }
  validates :title, length: { maximum: 100,
    too_long: "%{count} characters is the maximum allowed" }
end
