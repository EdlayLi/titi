# frozen_string_literal: true

module Admin
  class RoutesController < Admin::BaseController
    before_action :set_route, only: [:show, :edit, :update, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_routes

    def index
      @routes = Route.all
    end

    def show; end

    def new
      @route = Route.new
    end

    def create
      @route = Route.new(routes_params)

      if @route.save
        redirect_to [:admin, @route]
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @route.update(routes_params)
        redirect_to [:admin, @route]
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @route.destroy
      redirect_to_routes
    end

    private

    def set_route
      @route = Route.find(params[:id])
    end

    def routes_params
      params.require(:route).permit(:name, railway_station_ids: [])
    end

    def redirect_to_routes
      redirect_to admin_routes_path
    end
  end
end
