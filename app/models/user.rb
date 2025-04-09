class User < ApplicationRecord
  has_many :members
  has_many :boards, through: :members

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true
end
