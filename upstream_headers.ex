defmodule UpstreamHeaders do
  alias Plug.Conn

  @behaviour Plug


  @spec init(Keyword.t()) :: Keyword.t()
  def init(opts) do
    opts
  end

  def call(conn, opts) do
    if is_list(opts[:headers]) do
      update_conn_header(opts[:headers], conn)
    else
      conn
    end
  end

  defp update_conn_header([{headerKey, headerValue} | tail], conn) do
    update_conn_header(tail, Conn.put_req_header(conn, headerKey, headerValue))
  end

  defp update_conn_header(_, conn) do
    conn
  end

end
