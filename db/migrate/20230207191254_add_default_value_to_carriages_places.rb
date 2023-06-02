# frozen_string_literal: true

class AddDefaultValueToCarriagesPlaces < ActiveRecord::Migration[7.0]
  def change
    change_table :carriages, bulk: true do
      change_column_default :carriages, :top_places, from: nil, to: 0
      change_column_default :carriages, :bottom_places, from: nil, to: 0
      change_column_default :carriages, :side_top_places, from: nil, to: 0
      change_column_default :carriages, :side_bottom_places, from: nil, to: 0
      change_column_default :carriages, :seat_places, from: nil, to: 0
    end
  end
end
