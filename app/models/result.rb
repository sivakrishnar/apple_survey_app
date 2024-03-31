class Result < ApplicationRecord
  belongs_to :survey
  belongs_to :user

  validates :answer, inclusion: [true, false]

  def yes_or_no
    self.answer ? 'Yes' : 'No'
  end
end
