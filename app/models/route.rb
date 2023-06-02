# frozen_string_literal: true

class Route < ApplicationRecord
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes
  has_many :trains

  scope :search_by_station, ->(start_station, end_station) { # rubocop:disable Style/Lambda
    joins(:railway_stations_routes)
      .where(railway_stations_routes: { railway_station_id: [start_station.id, end_station.id] })
      .route_selection
  }

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name
  before_update :update_name

  def set_station_position(station, position_number)
    railway_stations_routes.find_by(railway_station_id: station.id).update(position: position_number)
  end

  def self.route_selection
    group(:id).having("count(*) = 2")
  end

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def update_name
    first_station = railway_stations_routes.find_by(position: min_position)&.railway_station
    last_station = railway_stations_routes.find_by(position: max_position)&.railway_station
    self.name = "#{first_station&.title} - #{last_station&.title}"
  end

  def min_position
    railway_stations.minimum(:position)
  end

  def max_position
    railway_stations.maximum(:position)
  end

  def stations_count
    errors.add(:base, "Route should contain at least 2 station!") if railway_stations.size < 2
  end
end
