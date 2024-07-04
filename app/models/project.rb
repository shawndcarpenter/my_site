class Project < ApplicationRecord
  has_many :project_points
  has_many :project_skills
  has_many :skills, through: :project_skills

  def repos
    github.split(';')
  end
end
