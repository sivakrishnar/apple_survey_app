class SurveysController < ApplicationController
  before_action :set_survey, only: :show

  # GET /surveys or /surveys.json
  def index
    @surveys = Survey.includes(:results)
  end

  # GET /surveys/1 or /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # POST /surveys or /surveys.json
  def create
    @survey = Survey.new(survey_params) do |survey|
      survey.user = current_user
    end

    respond_to do |format|
      if @survey.save
        format.html { redirect_to surveys_url, notice: "Survey was successfully created." }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.includes(:results).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.require(:survey).permit(:question)
    end
end
