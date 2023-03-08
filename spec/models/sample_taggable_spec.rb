require 'rails_helper'

RSpec.describe SampleTaggable, type: :model do
  describe "hook" do
    it "has a valid factory" do
      build(:sample_taggable).should be_valid 
    end
  end

  describe "associations" do
    it { should belong_to(:sample) }
    it { should belong_to(:sample_tag) }
  end
end
