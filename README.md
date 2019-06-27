# UpstreamHeaders

A upstream headers plug for set some Headers of HTTP proxying a request.
Use it with another Plug such as ReverseProxyPlug (https://github.com/tallarium/reverse_proxy_plug)

## Installation

Add `upstreamheaders` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:upstream_headers, git: "https://github.com/adaptunit/upstream_headers/"}
  ]
end
```

## Usage

Please see [custom_upstream_proxy.ex](https://github.com/adaptunit/upstream_headers/blob/master/custom_upstream_proxy.ex)  for example.
Below it's part of router.ex ...

```elixir
  scope "/upstream" do
    pipe_through [:proxy_protected]
    forward("/", CustomUpstreamProxy, upstream: "http://proxied.url:80/path",
            headers: [
              {"X-Header", "some value"}
            ])
  end
```


## License

UpstreamHeaders is released under the MIT License.


