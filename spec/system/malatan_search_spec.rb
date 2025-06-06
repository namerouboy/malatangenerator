require 'rails_helper'

RSpec.describe "マーラータン検索", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "野菜の中からじゃがいもを選択して検索し、結果にじゃがいもが表示され、レシピを保存できる" do
    visit root_path

    expect(page).to have_css("[data-name='じゃがいも']", wait: 5)
    find("[data-name='じゃがいも']").click

    click_button "煮込む"

    expect(page).to have_content("じゃがいも", wait: 5)

    # 「レシピ名」フォームに入力する
    fill_in "レシピ名：", with: "じゃがいものレシピ"

    # 保存ボタンをクリック
    click_button "このレシピを保存する"

    # 保存成功メッセージが表示されているか確認
    expect(page).to have_content("レシピを保存しました！", wait: 5)
  end
end
