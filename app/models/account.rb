class Account < ApplicationRecord
  has_many :records, dependent: :destroy
end
