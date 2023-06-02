# frozen_string_literal: true

class RailwayStationsRoute < ApplicationRecord
  belongs_to :railway_station
  belongs_to :route

  validates :railway_station_id, uniqueness: { scope: :route_id }

  class << self
    def departure_time(station)
      find_by(railway_station_id: station.id).departure_time
    end

    def arrival_time(station)
      find_by(railway_station_id: station.id).arrival_time
    end
  end
end
