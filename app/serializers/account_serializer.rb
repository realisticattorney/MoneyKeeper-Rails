class AccountSerializer < ActiveModel::Serializer
  # include NullAttributesRemover
  attributes :id, :created_by, :created_at, :updated_at
  has_many :records
end
