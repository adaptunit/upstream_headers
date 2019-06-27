defmodule CustomUpstreamProxy do

  @behaviour Plug

  def init(opts) do
    {UpstreamHeadersProxy.init(opts), ReverseProxyPlug.init(opts)}
  end

  def call(conn, {optsPlug1, optsPlug2}) do
    with %{halted: false} = conn <- UpstreamHeaders.call(conn, optsPlug1),
         %{halted: false} = conn <- ReverseProxyPlug.call(conn, optsPlug2),
         do: conn
  end
end
