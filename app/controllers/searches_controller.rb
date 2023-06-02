# frozen_string_literal: true

class SearchesController < ApplicationController
  def show
    @stations = RailwayStation.all
  end

  def new; end

  def result
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
    routes = Search.routes_by_station_ids(@start_station, @end_station)
    @trains = Train.joins(:route).where(route_id: routes&.pluck(:id))
  end
end
