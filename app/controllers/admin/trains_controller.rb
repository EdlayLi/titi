# frozen_string_literal: true

module Admin
  class TrainsController < Admin::BaseController
    before_action :set_train, only: %i[show edit update destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_trains

    def index
      @trains = Train.all
    end

    def show; end

    def new
      @train = Train.new
    end

    def edit; end

    def create
      @train = Train.new(train_params)

      if @train.save
        redirect_to [:admin, @train]
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @train.update(train_params)
        redirect_to [:admin, @train]
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @train.destroy
      redirect_to_trains
    end

    private

    def set_train
      @train = Train.find(params[:id])
      @carriages = @train.ordered_carriages
    end

    def train_params
      params.require(:train).permit(:number, :route_id, :current_station_id, :sort_order)
    end

    def redirect_to_trains
      redirect_to admin_trains_path
    end
  end
end
