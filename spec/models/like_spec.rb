require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "hook" do
    it "has a valid factory" do
      build(:like).should be_valid
    end
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:sample) }
  end
end
