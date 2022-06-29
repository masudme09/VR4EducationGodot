defmodule Plugs.SocketInit do
  alias Plug.Conn

  def init(opts), do: opts

  def call(
        conn,
        _opts
      ) do
    config = Pow.Plug.fetch_config(conn)
    user = Pow.Plug.current_user(conn)

    conn
    |> Conn.put_session(:config, config)
    |> Conn.put_session(:current_user, user)
  end
end
