defmodule Webdriver.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Webdriver.Worker
    ]

    opts = [strategy: :one_for_one, name: Webdriver.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
