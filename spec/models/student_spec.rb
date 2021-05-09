require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should belong_to(:user) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:greekFname) }
  it { should validate_presence_of(:greekLname) }
  it { should validate_presence_of(:latinFname) }
  it { should validate_presence_of(:latinLname) }
  it { should validate_presence_of(:studentNumber) }
  it { should validate_presence_of(:institution) }
  it { should validate_presence_of(:school) }
  it { should validate_presence_of(:department) }
end
