# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
50.times do |index|
  Task.create(
    name: "#{Faker::Verb.base} #{Faker::Hobby.activity}",
    description: Faker::Quote.yoda,
    due_at: Faker::Date.between(from: 1.week.ago, to: 2.weeks.from_now),
    done: [true, false].sample,
  )
end
