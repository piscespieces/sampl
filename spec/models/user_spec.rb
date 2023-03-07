require 'rails_helper'

RSpec.describe User, type: :model do
  describe "hooks" do
    it 'has a valid factory' do
      build(:user).should be_valid
    end
  end

  describe "associations" do
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:sample_likes).through(:likes) }
  end

  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_confirmation_of(:password) }
  end
end
