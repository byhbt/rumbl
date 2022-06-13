defmodule RumblWeb.Auth do
  import Plug.Conn

  alias Rumbl.Account

  def init(opts), do: opts

  def call(conn, _otps) do
    user_id = get_session(conn, :user_id)

    user = user_id && Account.get_user(user_id)

    assign(conn, :current_user, user)
  end

  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end
end
