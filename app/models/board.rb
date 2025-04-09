class Board < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :users, through: :members

  has_many :canvas_objects, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { maximum: 50 }
  validates :description, length: { maximum: 500 }
end
