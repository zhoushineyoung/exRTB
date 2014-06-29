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
  def helloWPrototype() do
    :erlvolt.add_pool(:hello_pool, [{'172.17.0.4', 21212}])

    :erlvolt.call_procedure(:hello_pool, 'Insert', ['a', 's', 'd'])

    result1 = :erlvolt.call_procedure(:hello_pool, 'Select', ['a'])

    table1 = :erlvolt.get_table(result1, 1)
    row1 = :erlvolt.get_row(table1, 1)
    hello1 = :erlvolt.get_string(row1, table1, 'HELLO')
    world1 = :erlvolt.get_string(row1, table1, 'WORLD')

    :io.format('~n~s ~s!~n~n', [hello1, world1])

    :erlvolt.close_pool(:hello_pool)
  end
  def init() do
    :erlvolt.add_pool(:hello_pool, [{'', 21212}],[user: '',password: ''])
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
  use GenEvent

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