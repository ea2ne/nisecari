require 'rails_helper'
describe User do
  describe '#create' do
    it "プロバイダーが入っているか" do
      user = build(:user)
      expect(user).to be_valid
    end
