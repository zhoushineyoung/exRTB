defmodule Bank do
  use GenEvent
  def handle_call(:messages, messages) do
    {:ok, Enum.reverse(messages), []}
  end
  def handle_event({:log, x}, messages) do
    {:ok, [x|messages]}
  end
end
defmodule WebServer.Money do
  use GenEvent.Behaviour

  # Callbacks
  def init() do
    #gen_event.add_handler(self())

   #{:ok,{}}
  end
  def start() do
    end
  def start_link(a) do
    r={:ok, pidd} = GenEvent.start_link(name: :bank)
    GenEvent.add_handler(pidd,Bank,[])
    r
    #pid=pidd
    #IO.puts pid

    #{:ok,{}}
  end

end