defmodule RumblWeb.UserController do
  use RumblWeb, :controller

  alias Rumbl.Account
  alias Rumbl.Account.User
  alias RumblWeb.Auth

  plug :authenticate when action in [:index, :show]

  def index(conn, _params) do
    # case authenticate(conn) do
    #   %Plug.Conn{halted: true} = conn ->
    #     conn
    #   conn ->
    users = Account.list_users()

    render(conn, "index.html", users: users)
    # end
  end

  def show(conn, %{"id" => id}) do
    user = Account.get_user!(id)

    render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    changeset = Account.change_registration(%User{})

    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Account.register_user(user_params) do
      {:ok, user} ->
        conn
        |> Auth.login(user)
        |> put_flash(:info, "#{user.name} created")
        |> redirect(to: Routes.user_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  defp authenticate(conn, _opts) do
    if conn.assigns.current_user do
      conn
    else
      conn
      |> put_flash(:error, "You must be logged in to access this page")
      |> redirect(to: Routes.page_path(conn, :index))
      |> halt()
    end
  end
end
