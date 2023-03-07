require 'rails_helper'

RSpec.describe Sample, type: :model do
  describe "hook" do
    it "has a valid factory" do
      build(:sample).should be_valid 
    end
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should belong_to(:sample_pack) }
    it { should have_one_attached(:audio) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:user_likes).through(:likes) }
  end
end
