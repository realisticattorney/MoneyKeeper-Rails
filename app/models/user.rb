class User < ApplicationRecord
  has_secure_password

  has_many :accounts, foreign_key: :created_by
  validates :email, presence: true, format: { with: /\S+@\S+\.\S+/ }
  validates_presence_of :name, :email, :password_digest
end