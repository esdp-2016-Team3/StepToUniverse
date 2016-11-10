role :app, %w(hosting_karambakg@chromium.locum.ru)
role :web, %w(hosting_karambakg@chromium.locum.ru)
role :db, %w(hosting_karambakg@chromium.locum.ru)

set :ssh_options, forward_agent: true
set :rails_env, :production
