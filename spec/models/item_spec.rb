require 'rails_helper'

describe Item do
  describe '#create' do
    it "is valid with item" do
      items = build(:item)
      expect(items).to be_valid
    end

    it "is valid with a name, price, item_introduction, item_condition_id, postage_payer_id, preparation_day_id, prefecture_id, category_id, user_id, brand_id" do
      item = FactoryBot.build(:item)
      binding.pry
      expect(item).to be_valid
    end

    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "is invalid without a item_introduction" do
      item = build(:item, item_introduction: nil)
      item.valid?
      expect(item.errors[:item_introduction]).to include("を入力してください")
    end

    it "is invalid without a item_condition_id" do
      item = build(:item, item_condition_id: nil)
      item.valid?
      expect(item.errors[:item_condition_id]).to include()
    end

    it "is invalid without a postage_payer_id" do
      item = build(:item, postage_payer_id: nil)
      item.valid?
      expect(item.errors[:postage_payer_id]).to include()
    end

    it "is invalid without a preparation_day_id" do
      item = build(:item, preparation_day_id: nil)
      item.valid?
      expect(item.errors[:preparation_day_id]).to include()
    end

    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include()
    end

    it "is invalid without a brand_id" do
      item = build(:item, brand_id: nil)
      item.valid?
      expect(item.errors[:brand_id]).to include()
    end

    it "is invalid without a category" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include()
    end

    it "is invalid without a seller" do
      item = build(:item, seller: nil)
      item.valid?
      expect(item.errors[:seller]).to include("を入力してください")
    end

    it "is invalid with a name that has more than 41 characters" do
      item = build(:item, name: "ppppppppppppppppppppppppppppppppppppppppp")
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "is valid with a name that has less than 40 characters" do
      item = build(:item, name: "pppppppppppppppppppppppppppppppppppppppp")
      expect(item).to be_valid
    end

    it "is invalid with a item_introduction that has more than 1001" do
      item = build(:item, item_introduction: "a"*1001)
      item.valid?
      expect(item.errors[:item_introduction]).to include()
    end

    it "is valid with a item_introduction that has less than 1000 characters" do
      item = build(:item, item_introduction: "a"*999)
      expect(item).to be_valid
    end

    it "is invalid with a price that has less than 300 characters" do
      item = build(:item, price: 299)
      item.valid?
      expect(item.errors[:price]).to include()
    end

    it "is valid with a price that has more than 300" do
      item = build(:item, price: 300)
      expect(item).to be_valid
    end

    it "is invalid with a price that has more than 10000000 characters" do
      item = build(:item, price: 10000000)
      item.valid?
      expect(item.errors[:price]).to include()
    end

    it "is valid with a price that has less than 9999999" do
      item = build(:item, price: 9999999)
      expect(item).to be_valid
    end

    it "is invalid without a image" do
      item_image = build(:item_image)
      item_image.valid?
      expect(item_image.errors[:item_image]).to include()
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