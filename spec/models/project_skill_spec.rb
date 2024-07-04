require "rails_helper"

RSpec.describe ProjectSkill, type: :model do
  describe "relationships" do
    it { should belong_to :project }
    it { should belong_to :skill }
  end
end