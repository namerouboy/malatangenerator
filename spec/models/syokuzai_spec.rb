require 'rails_helper'

RSpec.describe Syokuzai, type: :model do
  describe '.search_by_names' do
    before do
      Syokuzai.create!(name: "白菜")
      Syokuzai.create!(name: "もやし")
      Syokuzai.create!(name: "春雨")
    end

    it "名前が一致する食材を返す" do
      params = [
        ActionController::Parameters.new({ name: "白菜" }),
        ActionController::Parameters.new({ name: "春雨" })
      ]
      result = Syokuzai.search_by_names(params)

      expect(result.map(&:name)).to contain_exactly("白菜", "春雨")
    end
  end
end