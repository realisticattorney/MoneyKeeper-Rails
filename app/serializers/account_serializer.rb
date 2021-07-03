class AccountSerializer < ActiveModel::Serializer
  def attributes
    hash = super
    hash.each do |key, value|
      if value.nil?
        hash.delete(key)
      end
    end
    hash
  end
  attributes :id, :created_by, :created_at, :updated_at
  has_many :records
end
