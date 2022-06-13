defmodule RumblWeb.UserView do
  use RumblWeb, :view

  def first_name(%Rumbl.Account.User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
