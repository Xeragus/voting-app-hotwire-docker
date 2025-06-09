class Option < ApplicationRecord
  belongs_to :poll
  has_many :votes

  validates :text, presence: true

  def vote_count
    votes.count
  end

  def vote_percentage(total_votes = nil)
    total_votes ||= poll.options.sum(&:vote_count)
    return 0 if total_votes.zero?

    ((vote_count.to_f / total_votes) * 100).round
  end
end
