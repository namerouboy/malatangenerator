# 基本設定ファイル(spec_helperを読み込む)
require 'spec_helper'
# Pumaサーバ(Railsを動かすためのアプリケーションサーバー)を使えるようにする
require 'rack/handler/puma'
# RAILS_ENV を test環境 にセット
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
#本番環境の場合エラーが発生したら停止する
abort("The Rails environment is running in production mode!") if Rails.env.production?

# RSpecとRailsの連携をセットアップ
require 'rspec/rails'

# spec/supportフォルダのファイルを読み込む
Dir[Rails.root.join('spec/support/**/*.rb')].sort.each { |f| require f }

# テスト用DBが最新かどうかチェック
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # テスト用ダミーデータ(fixtures)の保存先を設定
  config.fixture_paths = [
    Rails.root.join('spec/fixtures')
  ]

  # トランザクションの使用
  config.use_transactional_fixtures = true

  # Railsエラーバックトレースを見やすくする
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
