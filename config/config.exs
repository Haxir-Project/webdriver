import Config

config :wallaby,
  driver: Wallaby.Chrome,
  chromedriver: [
    headless: false
  ],
  hackney_options: [timeout: :infinity, recv_timeout: :infinity]
