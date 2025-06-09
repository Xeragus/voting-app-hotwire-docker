class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def show
    @poll = Poll.includes(options: :votes).find_by(id: params[:id])

    @total_votes = @poll&.options&.sum(&:vote_count)
  end
end
