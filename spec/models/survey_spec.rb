require 'rails_helper'

RSpec.describe Survey, type: :model do

  it "is valid with valid attributes" do
    expect(build(:survey)).to be_valid
  end

  it "is not valid with out question" do
    survey_without_question = build(:survey, question: nil)
    expect(survey_without_question).to_not be_valid
  end

  it "is not valid if question is not unique" do
    survey = create(:survey)
    duplicate_survey = build(:survey)
    expect(duplicate_survey).to_not be_valid
  end

  it "is not valid if question is not unique case insensitive" do
    survey = create(:survey)
    duplicate_survey = build(:survey, question: "SAMPLE survey question")
    expect(duplicate_survey).to_not be_valid
  end

  it "is not valid without a user" do
    survey = build(:survey, user: nil)
    expect(survey).to_not be_valid
  end

  it "has many results" do
    survey = create(:survey)
    user = create(:user)

    survey.results.create(answer: true, user: user)
    survey.results.create(answer: false, user: user)
    expect(survey.results.count).to eq(2)
  end

  it "should correctly return total_responses based on results count" do
    survey = create(:survey)
    user = create(:user)

    survey.results.create(answer: true, user: user)
    survey.results.create(answer: false, user: user)
    expect(survey.total_responses).to eq(2)
  end

  it "should correctly yes and no percentage to 0 when no responses exists" do
    survey = create(:survey)

    expect(survey.yes_percentage).to eq(0)
    expect(survey.no_percentage).to eq(0)
  end

  it "should correctly set yes and no percentage" do
    survey = create(:survey)
    user = create(:user)

    survey.results.create(answer: true, user: user)
    survey.results.create(answer: false, user: user)
    expect(survey.yes_percentage).to eq(50)
    expect(survey.no_percentage).to eq(50)
  end
end
