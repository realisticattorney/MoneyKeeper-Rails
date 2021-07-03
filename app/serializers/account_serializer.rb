class AccountSerializer < ActiveModel::Serializer
  attributes :id, :created_by, :created_at
  has_many :records
end
