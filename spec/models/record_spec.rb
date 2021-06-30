# spec/models/record_spec.rb
require 'rails_helper'

# Test suite for the record model
RSpec.describe Record, type: :model do
  # Association test
  it { should belong_to(:account) }
  # it { should belong_to(:user) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:flow_direction) }
  it { should validate_presence_of(:pending) }
end