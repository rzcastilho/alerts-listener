defmodule AlertsListenerTest do
  use ExUnit.Case
  doctest AlertsListener

  test "greets the world" do
    assert AlertsListener.hello() == :world
  end
end
