#defmodule Bank do
#  use GenEvent
#  def handle_call(:messages, messages) do
#    {:ok, Enum.reverse(messages), []}
#  end
#  def handle_call(:getMoney, messages) do
#    {:ok, "abv", []}
#  end
#  def handle_event({:log, x}, messages) do
#    {:ok, [x|messages]}
#  end
#end
defmodule Bank do
  use GenEvent
  def init() do
    {:ok,0}
  end
  def handle_call(:balance, balance) do
    {:ok, balance, []}
  end
  def handle_call({:getMoney, amount}, balance) do
    balance=balance - amount
    {:ok, balance, balance}
  end
  def handle_call({:setMoney, amount}, balance) do
    {:ok, balance+amount, balance+amount}
  end
  def handle_event({:log, x}, balance) do
    {:ok, balance-x}
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
    GenEvent.add_handler(pidd,Bank,0)
    r
    #pid=pidd
    #IO.puts pid

    #{:ok,{}}
  end

end