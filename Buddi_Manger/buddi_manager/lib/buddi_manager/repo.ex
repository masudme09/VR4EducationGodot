defmodule BuddiManager.Repo do
  use Ecto.Repo,
    otp_app: :buddi_manager,
    adapter: Ecto.Adapters.Postgres
end
