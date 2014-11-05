class API::V1::VotesController < ApplicationController


  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      render json: @vote, status: :created, location: api_v1_votes_path(@vote)
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json


  private

    def vote_params
      params.require(:vote).permit(:voter, :candidate)
    end
end
