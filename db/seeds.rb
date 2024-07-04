# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
skills = [
  "SQL",
  "APIs",
  "ActiveRecord",
  "Agile Workflow",
  "REST",
  "GraphQL",
  "Ruby",
  "Ruby on Rails",
  "Python",
  "HTML",
  "C",
  "CSS",
  "Git",
  "GitHub",
  "Heroku Deployment",
  "Postman",
  "DigitalOcean",
  "BootStrap",
  "MVC",
  "OAuth",
  "Unit Testing",
  "Integration Testing",
  "CSV parsing",
  "JavaScript"
]

# Create skills records
skills.each do |skill|
  Skill.create(text: skill)
end