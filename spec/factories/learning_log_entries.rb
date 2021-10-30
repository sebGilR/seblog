FactoryBot.define do
  factory :learning_log_entry do
    content { "MyText" }
    association :learning_log
  end
end
