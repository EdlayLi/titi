# frozen_string_literal: true

class AddPassportDetailsToTickets < ActiveRecord::Migration[7.0]
  def change
    change_table :tickets, bulk: true do
      add_column :tickets, :passport_series, :integer
      add_column :tickets, :passport_number, :integer
    end
  end
end
