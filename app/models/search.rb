# frozen_string_literal: true

class Search < ApplicationRecord
  def self.routes_by_station_ids(start_station, end_station)
    Route.search_by_station(start_station, end_station) if start_station != end_station
  end
end
