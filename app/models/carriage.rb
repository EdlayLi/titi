# frozen_string_literal: true

class Carriage < ApplicationRecord
  TYPES = %w[CoupeCarriage EconomyCarriage LuxCarriage SeatedCarriage].freeze

  belongs_to :train

  scope :coupe, -> { where(type: TYPES[0]) }
  scope :economy, -> { where(type: TYPES[1]) }
  scope :lux, -> { where(type: TYPES[2]) }
  scope :seated, -> { where(type: TYPES[3]) }
  scope :ordered_by_number, -> { order(:number) }

  validates :number, presence: true
  validates :position, uniqueness: { scope: :train_id }

  before_create :set_position

  private

  def set_position
    self.position = train.carriages.maximum(:position).to_i + 1
  end
end
