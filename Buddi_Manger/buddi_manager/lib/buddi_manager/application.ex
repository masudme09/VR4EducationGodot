defmodule BuddiManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      BuddiManager.Repo,
      # Start the Telemetry supervisor
      BuddiManagerWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: BuddiManager.PubSub},
      # Start the Endpoint (http/https)
      BuddiManagerWeb.Endpoint
      # # Or in a distributed system:
      # Start a worker by calling: BuddiManager.Worker.start_link(arg)
      # {BuddiManager.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BuddiManager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BuddiManagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
