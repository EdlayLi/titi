# frozen_string_literal: true

class SeatedCarriage < Carriage
  validates :seat_places, numericality: { greater_than: 0 }
end
