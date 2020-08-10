require 'rails_helper'
describe Profile do
  describe '#create' do
    it "is valid with a first_name, family_name, first_name_kana, family_name_kana, birth_day, introduction" do
      profile = build(:profile)
      expect(profile).to be_valid
    end

    it "is invalid without a first_name" do
      profile = build(:profile, first_name: nil)
      profile.valid?
      expect(profile.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a family_name" do
      profile = build(:profile, family_name: nil)
      profile.valid?
      expect(profile.errors[:family_name]).to include("を入力してください")
    end

    it "is invalid without a first_name_kana" do
      profile = build(:profile, first_name_kana: nil)
      profile.valid?
      expect(profile.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a family_name_kana" do
      profile = build(:profile, family_name_kana: nil)
      profile.valid?
      expect(profile.errors[:family_name_kana]).to include("を入力してください")
    end

    it "is invalid without a birth_day" do
      profile = build(:profile, birth_day: nil)
      profile.valid?
      expect(profile.errors[:birth_day]).to include("を入力してください")
    end

    it "is invalid without a introduction" do
      profile = build(:profile, introduction: nil)
      profile.valid?
      expect(profile.errors[:introduction]).to include("を入力してください")
    end
  end
end

