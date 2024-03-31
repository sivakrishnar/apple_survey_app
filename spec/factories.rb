FactoryBot.define do

  factory :survey do
    question { "sample survey question" }
    user factory: :user, email: "email@gmail.com"
  end

  factory :user do
    email { "joe@gmail.com" }
    password { "blahblah" }
  end

  factory :result do
    answer { true }
    survey
    user
  end

end
