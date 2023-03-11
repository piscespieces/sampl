require 'rails_helper'

RSpec.describe SamplePack, type: :model do
  describe "hook" do
    it "has a valid factory" do
      build(:sample_pack).should be_valid
    end
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should have_one_attached(:image) }
    it { should have_many(:samples).dependent(:destroy) }
    it { should accept_nested_attributes_for(:samples).allow_destroy(true) }
  end
end
