require 'rails_helper'

RSpec.describe User, type: :model do
  # ensure User model has a 1:m relationship with the Student model
  it { should have_many(:students) }
  # Validation tests
  # ensure name, email and password_digest are present before save
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password_digest) }
end
