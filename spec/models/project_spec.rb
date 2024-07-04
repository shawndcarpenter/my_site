require "rails_helper"

RSpec.describe Project, type: :model do
  describe "relationships" do
    it { should have_many :project_points }
    it { should have_many :project_skills }
    it { should have_many(:skills).through(:project_skills) }
  end
end