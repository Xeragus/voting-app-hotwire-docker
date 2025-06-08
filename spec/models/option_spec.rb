require 'rails_helper'

RSpec.describe Option, type: :model do
it { should belong_to(:poll) }
  it { should have_many(:votes) }
  it { should validate_presence_of(:text) }

  describe '#vote_count' do
    it 'returns the number of associated votes' do
      option = create(:option)
      create_list(:vote, 3, option: option)
      expect(option.vote_count).to eq(3)
    end
  end
end
