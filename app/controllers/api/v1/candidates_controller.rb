class API::V1::CandidatesController < ActionController::API

 include ActionController::HttpAuthentication::Token::ControllerMethods


  def index
    @candidates = Candidate.all

    render json: @candidates
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
    @candidate = Candidate.find(params[:id])

    render json: @candidate
  end

  # POST /candidates
  # POST /candidates.json

  private

    def candidate_params
      params.require(:candidate).permit(:name, :party)
    end
end
