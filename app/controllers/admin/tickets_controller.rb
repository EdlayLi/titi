# frozen_string_literal: true

module Admin
  class TicketsController < Admin::BaseController
    before_action :set_ticket, only: %i[show edit update destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_tickets

    def index
      @tickets = Ticket.all
    end

    def show; end

    def new
      @ticket = Ticket.new
    end

    def edit; end

    def create
      @ticket = Ticket.new(ticket_params)

      if @ticket.save
        redirect_to [:admin, @ticket]
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @ticket.update(ticket_params)
        redirect_to [:admin, @ticket]
      else
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      @ticket.destroy
      redirect_to_tickets
    end

    private

    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    def ticket_params
      params.require(:ticket).permit(:number, :user_id, :train_id, :start_station_id, :end_station_id, :passport_number,
                                     :passport_series)
    end

    def redirect_to_tickets
      redirect_to admin_tickets_path
    end
  end
end
