class Record < ApplicationRecord
  # validates :user, presence: true
  # belongs_to :user
  validates :account, presence: true
  belongs_to :account

  validates_presence_of :flow_direction
  validates_presence_of :pending
  validates :description, length: { maximum: 160 }
end
