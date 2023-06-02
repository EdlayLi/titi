# frozen_string_literal: true

class AddPlacesToCarriages < ActiveRecord::Migration[7.0]
  def change
    change_table :carriages, bulk: true do
      add_column :carriages, :side_top_places, :integer
      add_column :carriages, :side_bottom_places, :integer
      add_column :carriages, :seat_places, :integer
      add_column :carriages, :position, :integer
    end
  end
end
