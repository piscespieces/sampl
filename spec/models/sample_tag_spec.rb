require 'rails_helper'

RSpec.describe SampleTag, type: :model do
  describe "hook" do
    it "has a valid factory" do
      build(:sample_tag).should be_valid 
    end
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
  end
end
