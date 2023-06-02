# frozen_string_literal: true

class AddSortOrderToTrains < ActiveRecord::Migration[7.0]
  def change
    add_column :trains, :sort_order, :boolean, default: false
  end
end
