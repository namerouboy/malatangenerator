require 'capybara/rails'

Capybara.server_host = '0.0.0.0' # Capybaraのサーバーをどこからでもアクセスできる設定に
Capybara.server_port = 3001 # 空いてる任意のポート（CI上で他と被らなければOK）
Capybara.app_host = "http://127.0.0.1:3001" #テスト時のブラウザのURL
Capybara.save_path = Rails.root.join("tmp/capybara") #スクリーンショットの保存先
FileUtils.mkdir_p(Capybara.save_path) unless File.directory?(Capybara.save_path)#保存先のフォルダがなければ作る