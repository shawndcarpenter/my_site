require "rails_helper"

RSpec.describe EducationPoint, type: :model do
  describe "relationships" do
    it { should belong_to :education }
  end
end