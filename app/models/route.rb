class Route < ApplicationRecord
  has_many :route_points, dependent: :destroy
  accepts_nested_attributes_for :route_points, allow_destroy: true
  accepts_nested_attributes_for :route_points, reject_if: lambda {|attributes| attributes['title'].blank?}
  has_many :business_processes
  has_many :tasks, through: :route_points
  belongs_to :user
  validates :title, :description, :author_id, presence: true
  validates :title, uniqueness: true
  validates :title, length: { minimum: 3 }
  validates :title, length: { maximum: 100,
    too_long: "%{count} characters is the maximum allowed" }
end
