require "rails_helper"

RSpec.describe Education, type: :model do
  describe "relationships" do
    it { should have_many :education_points }
  end
end