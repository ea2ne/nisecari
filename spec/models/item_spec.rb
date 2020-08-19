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
  end
end