require 'rails_helper'
describe SendingDestination do
  describe '#create' do
    it "is valid with a destination_first_name, destination_family_name, destination_first_name_kana, destination_family_name_kana, post_code, prefecture_code, city, house_number" do
      sending_destination = build(:sending_destination)
      expect(sending_destination).to be_valid
    end

    it "is invalid without a destination_first_name" do
      sending_destination = build(:sending_destination, destination_first_name: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:destination_first_name]).to include("を入力してください")
    end

    it "is invalid without a destination_family_name" do
      sending_destination = build(:sending_destination, destination_family_name: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:destination_family_name]).to include("を入力してください")
    end

    it "is invalid without a destination_first_name_kana" do
      sending_destination = build(:sending_destination, destination_first_name_kana: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:destination_first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a destination_family_name_kana" do
      sending_destination = build(:sending_destination, destination_family_name_kana: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:destination_family_name_kana]).to include("を入力してください")
    end

    it "is invalid without a post_code" do
      sending_destination = build(:sending_destination, post_code: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:post_code]).to include("を入力してください")
    end

    it "is invalid without a prefecture_code" do
      sending_destination = build(:sending_destination, prefecture_code: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:prefecture_code]).to include("を入力してください")
    end

    it "is invalid without a city" do
      sending_destination = build(:sending_destination, city: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:city]).to include("を入力してください")
    end

    it "is invalid without a house_number" do
      sending_destination = build(:sending_destination, house_number: nil)
      sending_destination.valid?
      expect(sending_destination.errors[:house_number]).to include("を入力してください")
    end
  end
end