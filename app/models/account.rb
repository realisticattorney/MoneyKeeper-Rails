class Account < ApplicationRecord
  # validates :user, presence: true
  # belongs_to :user

  has_many :records, dependent: :destroy
end
