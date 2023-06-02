# frozen_string_literal: true

class AddTimeZonesToStationsRoutes < ActiveRecord::Migration[7.0]
  def change
    change_table :railway_stations_routes, bulk: true do
      add_column :railway_stations_routes, :arrival_time, :time
      add_column :railway_stations_routes, :departure_time, :time
    end
  end
end
