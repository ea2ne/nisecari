require 'rails_helper'
describe SnsCredential do
  describe '#create' do
    it "プロバイダーが入っているか" do
      user = build(:sns_credential, provider: nil)
      user.valid?
    end

    it "uidが入っているか" do
      user = build(:sns_credential, uid: nil)
      user.valid?
    end
  end
end
