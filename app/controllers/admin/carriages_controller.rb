# frozen_string_literal: true

module Admin
  class CarriagesController < Admin::BaseController
    before_action :set_carriage, only: %i[show destroy edit update]
    before_action :set_train, only: %i[new create]

    def new
      @carriage = Carriage.new
    end

    def show; end

    def create
      @carriage = @train.carriages.new(carriage_params)

      if @carriage.save
        redirect_to_carriage
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @carriage.destroy
      redirect_to admin_train_path(@carriage.train_id)
    end

    def edit; end

    def update
      if @carriage.update(carriage_params)
        redirect_to_carriage
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def set_carriage
      @carriage = Carriage.find(params[:id])
    end

    def set_train
      @train = Train.find(params[:train_id])
    end

    def redirect_to_carriage
      redirect_to admin_carriage_path(@carriage)
    end

    def carriage_params
      params.require(:carriage).permit(:number, :train_id, :top_places, :bottom_places, :type, :side_top_places,
                                       :side_bottom_places, :seat_places)
    end
  end
end
