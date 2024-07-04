require "rails_helper"

RSpec.describe Experience, type: :model do
  describe "relationships" do
    it { should have_many :experience_points }
  end
end