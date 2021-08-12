class Record < ApplicationRecord
  belongs_to :account
  validates :account, presence: true

  validates_presence_of :flow_direction
  validates_presence_of :amount
  validates :description, length: { maximum: 160 }
end
