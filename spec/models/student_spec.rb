require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should belong_to(:user) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:id_number) }
  it { should validate_presence_of(:university) }
  it { should validate_presence_of(:department) }
end
