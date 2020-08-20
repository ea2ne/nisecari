require 'rails_helper'

RSpec.describe CreditCard do
  describe '#create' do
    it "is invalid without a customer_id" do
      card = build(:credit_card, customer_id: nil)
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end

    it "is invalid with a duplicate customer_id" do
      card = create(:credit_card)
      another_card = build(:credit_card, customer_id: card.customer_id)
      another_card.valid?
      expect(another_card.errors[:customer_id]).to include("はすでに存在します")
    end
  end
end
