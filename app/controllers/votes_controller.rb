class VotesController < ApplicationController
    def create
      @option = Option.find(params[:option_id])
      @vote = @option.votes.create!

      flash[:notice] = "You have successfully voted for option '#{@option.text}'."
  
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @option.poll }
      end
    end
end
