# ソケットで待ち受け
bind "unix:///home/namerou/malatangenerator/shared/sockets/puma.sock"

# 環境設定
environment ENV.fetch("RAILS_ENV") { "production" }

# ワーカー数
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

# スレッド数
threads ENV.fetch("RAILS_MIN_THREADS") { 5 }, ENV.fetch("RAILS_MAX_THREADS") { 5 }

# プリロード
preload_app!

# PID / state
pidfile "/home/namerou/malatangenerator/shared/pids/puma.pid"
state_path "/home/namerou/malatangenerator/shared/pids/puma.state"

# ログ
stdout_redirect "/home/namerou/malatangenerator/shared/log/puma.stdout.log",
                "/home/namerou/malatangenerator/shared/log/puma.stderr.log",
                true

# tmp_restart 対応
plugin :tmp_restart
