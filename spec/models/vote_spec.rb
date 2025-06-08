require 'rails_helper'

RSpec.describe Vote, type: :model do
  it { should belong_to(:option) }

  it 'is valid with valid attributes' do
    vote = build(:vote)
    expect(vote).to be_valid
  end
end
