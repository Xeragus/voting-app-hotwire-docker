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

  describe '#vote_percentage' do
    let(:poll) { create(:poll) }

    it 'returns 0 when there are no votes at all' do
      option = create(:option, poll: poll)
      expect(option.vote_percentage).to eq(0)
    end

    it 'returns 100 when it is the only option with all votes' do
      option = create(:option, poll: poll)
      create_list(:vote, 5, option: option)
      expect(option.vote_percentage).to eq(100)
    end

    it 'returns correct percentage when there are multiple options with votes' do
      option1 = create(:option, poll: poll)
      option2 = create(:option, poll: poll)
      create_list(:vote, 3, option: option1)
      create_list(:vote, 2, option: option2)

      expect(option1.vote_percentage).to eq(60)
      expect(option2.vote_percentage).to eq(40)
    end

    it 'uses passed total_votes if provided' do
      option = create(:option, poll: poll)
      create_list(:vote, 2, option: option)

      expect(option.vote_percentage(4)).to eq(50)
    end

    it 'returns 0 if provided total_votes is zero' do
      option = create(:option, poll: poll)
      expect(option.vote_percentage(0)).to eq(0)
    end
  end
end
