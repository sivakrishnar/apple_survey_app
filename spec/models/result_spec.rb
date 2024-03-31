require 'rails_helper'

RSpec.describe Result, type: :model do
  let(:survey) { create(:survey) }

  it "should return yes when answer is true" do
    survey = create(:survey)
    user = create(:user)

    result = survey.results.create(answer: true, user: user)
    expect(result.yes_or_no).to eq("Yes")
  end

  it "should return no when answer is false" do
    survey = create(:survey)
    user = create(:user)

    result = survey.results.create(answer: false, user: user)
    expect(result.yes_or_no).to eq("No")
  end
end
