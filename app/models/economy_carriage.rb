# frozen_string_literal: true

class EconomyCarriage < Carriage
  validates :top_places, :bottom_places, :side_top_places, :side_bottom_places, numericality: { greater_than: 0 }
end
