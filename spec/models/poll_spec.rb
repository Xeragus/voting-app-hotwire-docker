require 'rails_helper'

RSpec.describe Poll, type: :model do
  it { should have_many(:options).dependent(:destroy) }
  it { should validate_presence_of(:question) }
end
