require "rails_helper"

RSpec.describe SurveysController, type: :controller do
  let(:user) { create(:user) }
  let(:survey) { create(:survey) }

  before do
    sign_in user
  end

  describe "GET index" do
    it "should return 200 status code" do
      get :index
      expect(response.status).to eq(200)
      expect(assigns(:surveys)).to eq([survey])
      expect(response).to render_template("surveys/index")
    end
  end

  describe "GET show" do
    it "should return 200 status code" do
      get :show, params: {id: survey}
      expect(response.status).to eq(200)
      expect(assigns(:survey)).to eq(survey)
      expect(response).to render_template("surveys/show")
    end
  end

  describe "GET new" do
    it "should return 200 status code" do
      get :new
      expect(response.status).to eq(200)
      expect(response).to render_template("surveys/new")
    end
  end

  describe "POST create" do
    it "should create a survey with valid params" do
      post :create, params: { survey: {question: "sample question"} }
      expect(response.status).to eq(302)

      expect(assigns(:survey)).to be_a(Survey)
      expect(assigns(:survey)).to be_persisted
    end

    it "should not create a survey with invalid params" do
      post :create, params: { survey: {question: nil} }
      expect(response.status).to eq(422)

      expect(assigns(:survey)).to_not be_persisted
      expect(response).to render_template("surveys/new")
    end
  end
end
