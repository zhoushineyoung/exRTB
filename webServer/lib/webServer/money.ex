defmodule WebServer.Money do
  use GenEvent.Behaviour

  # Callbacks
  def init() do

  end
  def start_link(a) do
    :gen_event.start_link()
  end
  def handle_event({:log, x}, messages) do
    {:ok, [x|messages]}
  end

  def handle_call(:messages, messages) do
    {:ok, Enum.reverse(messages), []}
  end
end