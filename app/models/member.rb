class Member < ApplicationRecord
  belongs_to :user
  belongs_to :board

  enum :role, { owner: 0, editor: 1, viewer: 2 }

  validates :user_id, presence: true, uniqueness: { scope: :board_id }
  validates :board_id, presence: true
  validates :role, presence: true, inclusion: { in: roles.keys }
end
