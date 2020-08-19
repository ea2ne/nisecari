require 'rails_helper'
describe Item do
  describe '#create' do
    it "is valid with a name, price, item_introduction, brand_id, item_condition_id, postage_payer_id, preparation_day_id, prefecture_id, category_id, user_id" do
      item = FactoryBot.build(:item)
      expect(item).to be_valid
    end
  end
end