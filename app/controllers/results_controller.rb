class ResultsController < ApplicationController

  # POST /results or /results.json
  def create
    @result = Result.new(result_params) do |result|
      result.user = current_user
    end

    if @result.save
      redirect_to surveys_url, notice: "Survey response successfully saved"
    else
      redirect_to surveys_url, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_result
      @result = Result.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def result_params
      params.permit(:answer, :survey_id)
    end
end
