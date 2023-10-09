defmodule AlertsListener.Router do
  use Plug.Router

  plug(Plug.Logger, log: :debug)

  plug(Plug.Static,
    at: "/",
    from: :alerts_listener,
    only: ~w(favicon.ico)
  )

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:urlencoded, :json],
    json_decoder: Jason
  )

  plug(:dispatch)

  get "/health" do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "ok")
  end

  post "/alerts" do
    conn
    |> IO.inspect()
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "ok")
  end
end
