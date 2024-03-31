require "rails_helper"

RSpec.describe ResultsController, type: :controller do
  let(:current_user) { create(:user) }
  let(:survey) { create(:survey) }

  before do
    sign_in current_user
  end

  describe "POST create" do
    it "should create a result with valid params" do
      post :create, params: { survey_id: survey.id, answer: true }
      expect(response.status).to eq(302)

      expect(assigns(:result)).to be_persisted
    end

    it "should not create a result with invalid params" do
      post :create, params: { survey_id: survey.id, answer: nil}
      expect(response.status).to eq(422)

      expect(assigns(:result)).to_not be_persisted
    end
  end
end
