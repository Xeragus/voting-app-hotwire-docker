class PollsController < ApplicationController
  def index
    @polls = Poll.all
  end

  def show
    @poll = Poll.includes(options: :votes).find(params[:id])
  end
end
