FactoryBot.define do
  factory :user,aliases: [:seller] do
    nickname                      {"abe"}
    email                         {"kkk@email.com"}
    password                      {"0000test"}
    password_confirmation         {"0000test"}
  end
end
