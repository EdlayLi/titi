# frozen_string_literal: true

module TrainsHelper
  def departure_time(train, station)
    train.route.railway_stations_routes.departure_time(station).strftime('%I:%M')
  end

  def arrival_time(train, station)
    train.route.railway_stations_routes.arrival_time(station).strftime('%I:%M')
  end
end
