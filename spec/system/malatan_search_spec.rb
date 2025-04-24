require 'rails_helper'

RSpec.describe "マーラータン検索", type: :system do
  before do
    driven_by(:selenium_chrome_headless) # JS不要の設定。JSありにしたいなら :selenium_chrome_headless など
    # 必要なデータをセットアップ
    # @ingredient = Syokuzai.create!(
    #   category: "vegetables",
    #   name: "白菜",
    #   weight: 100,
    #   calorie: 20,
    #   explanation: "シャキシャキしてます"
    # )
    # Suuryou.create!(suuryou: 1)
  end

  it "野菜の中からじゃがいもを選択して検索し、結果にじゃがいもが表示される" do
    visit root_path

    # チェックボックスを模したボタンがJavaScriptで機能するならJSドライバが必要になるかも
    expect(page).to have_css("[data-name='じゃがいも']", wait: 5)
    find("[data-name='じゃがいも']").click

    # 送信ボタンをクリック
    click_button "煮込む"

    # 検索結果ページで「じゃがいも」が表示されていることを確認
    expect(page).to have_content("じゃがいも")
  end
end