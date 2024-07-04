require "rails_helper"

RSpec.describe ExperiencePoint, type: :model do
  describe "relationships" do
    it { should belong_to :experience }
  end
end