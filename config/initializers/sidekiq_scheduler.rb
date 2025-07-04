require "sidekiq"
require "sidekiq-scheduler"

Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(File.expand_path("../../sidekiq.yml", __FILE__))[:schedule]
    Sidekiq::Scheduler.reload_schedule!
  end
end
