# VPSで本番で動かすために書き直し

# スレッド設定
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# 本番ではポートではなくソケットを使う
bind "unix:///home/namerou/malatangenerator/shared/sockets/puma.sock"

# 環境設定
environment ENV.fetch("RAILS_ENV") { "production" }

# PID / state ファイル
pidfile "/home/namerou/malatangenerator/shared/pids/puma.pid"
state_path "/home/namerou/malatangenerator/shared/pids/puma.state"

# ワーカー数（プロセス数）
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# アプリをプリロード（メモリ節約 & 高速化）
preload_app!

# デーモン化（バックグラウンドで動かす）
daemonize true

# ログ出力先
stdout_redirect "/home/namerou/malatangenerator/shared/log/puma.stdout.log",
                "/home/namerou/malatangenerator/shared/log/puma.stderr.log",
                true

# bin/rails restart で再起動可能にする
plugin :tmp_restart
