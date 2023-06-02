# frozen_string_literal: true

module TicketsHelper
  def start_station(ticket)
    ticket.start_station
  end

  def end_station(ticket)
    ticket.end_station
  end

  def train(ticket)
    ticket.train
  end
end
