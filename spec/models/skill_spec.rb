require "rails_helper"

RSpec.describe Skill, type: :model do
  describe "relationships" do
    it { should have_many :project_skills }
    it { should have_many(:projects).through(:project_skills) }
  end
end