FactoryBot.define do
  factory :project_update do
    description { "MyText" }
    association :project 
  end
end
