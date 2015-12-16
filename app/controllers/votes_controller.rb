class VotesController < ApplicationController
  def index
    @votes = Vote.all

    @white_votes = @votes.select{ |vote| vote.choice == "blanc" }
    @LR_votes = @votes.select{ |vote| vote.choice == "LR"}
    @FN_votes = @votes.select{ |vote| vote.choice == "FN"}
    @PS_votes = @votes.select{ |vote| vote.choice == "PS"}

    @male_votes = @votes.select{ |vote| vote.is_male? }
    @male_percentage = (@male_votes.count.fdiv(@votes.count)) * 100

    @female_votes = @votes.select{ |vote| !vote.is_male? }
    @female_percentage = (@female_votes.count.fdiv(@votes.count)) * 100
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.create(vote_params)
    if @vote.save
      redirect_to votes_path
    else
      render 'new'
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:ssn, :choice)
  end

end
