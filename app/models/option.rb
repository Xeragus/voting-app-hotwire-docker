class Option < ApplicationRecord
  belongs_to :poll
  has_many :votes

  validates :text, presence: true

  def vote_count
    votes.count
  end
end
