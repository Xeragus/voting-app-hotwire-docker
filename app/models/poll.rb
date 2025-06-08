class Poll < ApplicationRecord
    has_many :options, dependent: :destroy

    validates :question, presence: true
end
