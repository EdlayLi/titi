# frozen_string_literal: true

class Train < ApplicationRecord
  belongs_to :current_station, class_name: 'RailwayStation'
  belongs_to :route
  has_many :tickets
  has_many :carriages

  validates :number, presence: true

  def seats_number(carriage_type, place_type)
    carriages.where(type: carriage_type).sum(place_type)
  end

  def number_carriages(carriage_type)
    carriages.where(type: carriage_type).count
  end

  def ordered_carriages
    if sort_order == false
      carriages.order(:position)
    else
      carriages.order(position: :desc)
    end
  end

  def search_station_position(station)
    route.railway_stations_routes.find_by(railway_station_id: station.id).position
  end
end
