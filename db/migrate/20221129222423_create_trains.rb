# frozen_string_literal: true

class CreateTrains < ActiveRecord::Migration[7.0]
  def change
    create_table :trains do |t|
      t.string :number

      t.timestamps
    end
  end
end
