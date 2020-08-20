require 'rails_helper'

RSpec.describe Item do
  describe '#create' do
    it "is valid with item" do
      items = build(:item)
      expect(items).to be_valid
    end
  end
  describe '#update' do
    it "is invalid without a item_itroduction" do
      items = build(:item, item_introduction: nil)
      items.valid?
      expect(items.errors[:item_introduction]).to include("を入力してください")
    end
    it "is invalid without a price" do
      items = build(:item, price: nil)
      items.valid?
      expect(items.errors[:price]).to include("を入力してください")
    end
    it "is invalid without a name" do
      items = build(:item, name: nil)
      items.valid?
      expect(items.errors[:name]).to include("を入力してください")
    end
    it "is invalid without a item_condition" do
      items = build(:item, item_condition: nil)
      items.valid?
      expect(items.errors[:item_condition]).to include("を入力してください")
    end
    it "is invalid without a postage_payer" do
      items = build(:item, postage_payer: nil)
      items.valid?
      expect(items.errors[:postage_payer]).to include("を入力してください")
    end
    it "is invalid without a prefecture" do
      items = build(:item, prefecture: nil)
      items.valid?
      expect(items.errors[:prefecture]).to include("を入力してください")
    end
    it "is invalid without a preparation_day" do
      items = build(:item, preparation_day: nil)
      items.valid?
      expect(items.errors[:preparation_day]).to include("を入力してください")
    end
  end
end