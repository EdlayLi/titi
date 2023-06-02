# frozen_string_literal: true

class CreateWagons < ActiveRecord::Migration[7.0]
  def change
    create_table :wagons do |t|
      t.string :number
      t.string :type
      t.integer :top_places
      t.integer :bottom_places

      t.timestamps
    end

    add_belongs_to :wagons, :train
  end
end
