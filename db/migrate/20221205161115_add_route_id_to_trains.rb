# frozen_string_literal: true

class AddRouteIdToTrains < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :trains, :route
  end
end
