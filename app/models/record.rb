class Record < ApplicationRecord
  # validates :user, presence: true
  # belongs_to :user
  belongs_to :account
  validates :account, presence: true

  validates_presence_of :flow_direction
  validates :description, length: { maximum: 160 }
end
