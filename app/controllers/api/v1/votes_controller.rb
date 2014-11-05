class API::V1::VotesController < ApplicationController
  before_filter :set_voter, only: [:create]
  before_filter :restrict_access_to_voter, only: [:create]

  def index
    @vote = Vote.all

    render json: @votes
  end


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

  def restrict_access_to_voter
    unless @voter.token == params[:token]
      render nothing: true, status: :unauthorized
    end
  end

  def set_voter
    @voter = Voter.find(params[:voter])
  end

  def vote_params
    params.require(:vote).permit(:voter, :candidate)
  end
end
