class VotesController < ApplicationController
  def index
    @votes = Vote.all
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.create(vote_params)
    if @vote.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def vote_params
    require(:vote).permit(:ssn, :choice)
  end

end
