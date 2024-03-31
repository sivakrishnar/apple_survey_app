class Survey < ApplicationRecord
  validates :question, presence: { message: "must be given"}
  validates :question, uniqueness: { case_sensitive: false, message: "already exists, please check" }

  belongs_to :user
  has_many :results


  def yes_percentage
    total_responses > 0 ? ((yes_responses / total_responses.to_f) * 100).round(2) : 0
  end

  def no_percentage
    total_responses > 0 ? (100.00 - yes_percentage).round(2) : 0
  end

  def total_responses
    @total_responses ||= results.count
  end

  private

  def yes_responses
    @yes_responses ||= results.select{|result| result.answer}.count
  end

  def no
    total_responses - yes_responses
  end

end
