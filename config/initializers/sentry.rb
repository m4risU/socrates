Sentry.init do |config|
  config.dsn = 'https://a14570eb6f87c9ee0a5819873843b870@o4506659578576896.ingest.sentry.io/4506659597320192'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end