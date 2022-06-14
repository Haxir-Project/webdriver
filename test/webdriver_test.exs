defmodule WebdriverTest do
  use ExUnit.Case
  doctest Webdriver

  test "greets the world" do
    assert Webdriver.hello() == :world
  end
end
