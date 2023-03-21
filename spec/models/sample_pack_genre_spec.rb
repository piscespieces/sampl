require 'rails_helper'

RSpec.describe SamplePackGenre, type: :model do
  describe "hook" do
    it "has valid factory" do
      build(:sample_pack_genre).should be_valid
    end
  end
end
