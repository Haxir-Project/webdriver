defmodule Webdriver.Helpers do
  import Wallaby.Browser

  def parse_haxball_code(content) do
    """
    window.onHBLoaded = () => {
      #{content}
    }

    if (typeof window.HBInit === 'function') window.onHBLoaded()
    """
  end

  def run_haxball_code(session, path) do
    {:ok, content} = File.read(Path.expand(path))

    session
    |> visit("https://haxball.com/headless")
    |> execute_script_async(parse_haxball_code(content))
  end
end
