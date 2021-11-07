# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
STATUSES = %w(draft published)

Article.delete_all
ProjectUpdate.delete_all
LearningLogEntry.delete_all
LearningLog.delete_all
Project.delete_all

100.times do
  Project.create(name: Faker::Company.name, description: Faker::Lorem.paragraph, status: STATUSES.sample)
  ProjectUpdate.create(description: Faker::Lorem.paragraph, project: Project.all.sample)
  LearningLog.create(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, status: STATUSES.sample, project_id: Project.all.sample)
  LearningLogEntry.create(content: Faker::Lorem.paragraph, learning_log_id: rand(1..LearningLog.count))
  Article.create(title: Faker::Lorem.sentence, text: Faker::Lorem.paragraphs(number: 20).join("\n"), status: STATUSES.sample, learning_log_id: LearningLog.all.sample)
end