require 'rails_helper'
# Test suite for the Account model
RSpec.describe Account, type: :model do
  # Association test
  # ensure Account model has a 1:1 relationship with the Item model
  it { should have_many(:records).dependent(:destroy) }
  # it { should belong_to(:user) }
  # Validation tests
  # ensure columns title and created_by are present before saving
end