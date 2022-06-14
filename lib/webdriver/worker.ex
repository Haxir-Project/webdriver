defmodule Webdriver.Worker do
  use GenServer
  import Webdriver.Helpers

  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  @impl true
  def init(opts \\ []) do
    GenServer.cast(self(), {:open_room, opts[:path] || "priv/static/bot.js"})

    {:ok, opts}
  end

  @impl true
  def handle_cast({:open_room, path}, state) do
    {:ok, session} = Wallaby.start_session()

    run_haxball_code(session, path)

    {:noreply, state}
  end
end
