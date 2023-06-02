# frozen_string_literal: true

class CoupeCarriage < Carriage
  validates :top_places, :bottom_places, numericality: { greater_than: 0 }
end
