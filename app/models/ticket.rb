# frozen_string_literal: true

class Ticket < ApplicationRecord
  SERIES_FORMAT = /\A\d{4}\z/.freeze
  NUMBER_FORMAT = /\A\d{6}\z/.freeze

  belongs_to :user
  belongs_to :train
  belongs_to :start_station, class_name: 'RailwayStation'
  belongs_to :end_station, class_name: 'RailwayStation'

  after_create :send_notification_create
  after_destroy :send_notification_destroy
  before_validation { self.number ||= SecureRandom.hex(5) }

  validates :number, presence: true, uniqueness: true
  validates :passport_series, presence: true, format: { with: SERIES_FORMAT }
  validates :passport_number, presence: true, format: { with: NUMBER_FORMAT }

  def name_route
    "#{start_station.title} - #{end_station.title}"
  end

  private

  def send_notification_create
    TicketsMailer.buy_ticket(self).deliver_later
  end

  def send_notification_destroy
    TicketsMailer.delete_ticket(self).deliver_later
  end
end
