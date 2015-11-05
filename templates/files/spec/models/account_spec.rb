require 'rails_helper'

RSpec.describe Account, type: :model do
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }
  it { should allow_value('valid@example.com').for(:email) }
  it { should_not allow_value('invalid').for(:email) }
end
