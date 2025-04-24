require 'rails_helper'

RSpec.describe "マーラータン検索", type: :system do
  before do
    driven_by(:selenium_chrome_headless) # JS不要の設定。JSありにしたいなら :selenium_chrome_headless など
    # 必要なデータをセットアップ
    @ingredient = Syokuzai.create!(
      category: "vegetables",
      name: "白菜",
      weight: 100,
      calorie: 20,
      explanation: "シャキシャキしてます"
    )
    Suuryou.create!(suuryou: 1)
  end

  it "野菜の中から白菜を選択して検索し、結果に白菜が表示される" do
    visit root_path

    # チェックボックスを模したボタンがJavaScriptで機能するならJSドライバが必要になるかも
    expect(page).to have_css("[data-name='白菜']", wait: 5)
    find("[data-name='白菜']").click

    # 送信ボタンをクリック
    click_button "煮込む"

    # 検索結果ページで「白菜」が表示されていることを確認
    expect(page).to have_content("白菜")
  end
end