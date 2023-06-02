# frozen_string_literal: true

module Admin
  class RailwayStationsController < Admin::BaseController
    before_action :set_railway_station,
                  only: %i[show edit update destroy update_position update_time]
    before_action :set_route, only: %i[update_position update_time]
    rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_railway_stations

    def index
      @railway_stations = RailwayStation.all
    end

    def show; end

    def new
      @railway_station = RailwayStation.new
    end

    def edit; end

    def create
      @railway_station = RailwayStation.new(railway_station_params)

      if @railway_station.save
        redirect_to [:admin, @railway_station]
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @railway_station.update(railway_station_params)
        redirect_to [:admin, @railway_station]
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @railway_station.destroy
      redirect_to_railway_stations
    end

    def update_position
      @railway_station.update_position(@route, params[:position])
      redirect_to_route
    end

    def update_time
      @railway_station.update_time(@route, params[:arrival_time], params[:departure_time])
      redirect_to_route
    end

    private

    def set_route
      @route = Route.find(params[:route_id])
    end

    def set_railway_station
      @railway_station = RailwayStation.find(params[:id])
    end

    def railway_station_params
      params.require(:railway_station).permit(:title)
    end

    def redirect_to_railway_stations
      redirect_to admin_railway_stations_path
    end

    def redirect_to_route
      redirect_to [:admin, @route]
    end
  end
end
