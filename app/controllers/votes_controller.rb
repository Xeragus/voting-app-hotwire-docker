class VotesController < ApplicationController
    def create
      @option = Option.find(params[:option_id])
      @vote = @option.votes.create!
  
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @option.poll }
      end
    end
end
