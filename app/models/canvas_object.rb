class CanvasObject < ApplicationRecord
  belongs_to :board

  validates :x, :y, :width, :height, presence: true
  validates :width, :height, numericality: { greater_than: 0 }
end
