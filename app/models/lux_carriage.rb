# frozen_string_literal: true

class LuxCarriage < Carriage
  validates :bottom_places, numericality: { greater_than: 0 }
end
