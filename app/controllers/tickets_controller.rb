# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: %i[show destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :redirect_to_tickets

  def index
    @tickets = current_user.tickets
  end

  def show; end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
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
    redirect_to tickets_path
  end
end
