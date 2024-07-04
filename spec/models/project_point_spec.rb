require "rails_helper"

RSpec.describe ProjectPoint, type: :model do
  describe "relationships" do
    it { should belong_to :project }
  end
end