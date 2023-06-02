# frozen_string_literal: true

class RailwayStation < ApplicationRecord
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes

  validates :title, presence: true

  scope :by_position, -> { order(:position) }
  scope :ordered, lambda {
    select('railway_stations.*, railway_stations_routes.position')
      .joins(:railway_stations_routes)
      .order("railway_stations_routes.position")
      .uniq
  }

  def update_position(route, position)
    station_route = station_route(route)
    station_route&.update(position: position)
  end

  def position_in(route)
    station_route(route).try(:position)
  end

  def time_in(route, type)
    time = station_route(route).public_send(type)
    time&.strftime('%I:%M')
  end

  def update_time(route, arrival_time, departure_time)
    station_route = station_route(route)
    station_route&.update(arrival_time: arrival_time, departure_time: departure_time)
  end

  private

  def station_route(route)
    @station_route ||= railway_stations_routes.find_by(route: route)
  end
end
