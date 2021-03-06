defmodule Rumbl.Multimedia.Video do
  use Ecto.Schema

  import Ecto.Changeset

  alias Rumbl.Account.User
  alias Rumbl.Multimedia.Category

  @primary_key {:id, Rumbl.Multimedia.Permalink, autogenerate: true}

  schema "videos" do
    field :description, :string
    field :title, :string
    field :url, :string
    field :slug, :string

    belongs_to :user, User
    belongs_to :category, Category

    timestamps()
  end

  def changeset(video, attrs) do
    video
    |> cast(attrs, [:url, :title, :category_id, :description])
    |> validate_required([:url, :title, :description])
    |> assoc_constraint(:category)
    |> slugify_title()
  end

  def slugify_title(changeset) do
    case fetch_change(changeset, :title) do
      {:ok, new_title} -> put_change(changeset, :slug, slugify(new_title))
      :error -> changeset
    end
  end

  defp slugify(title) do
    title
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/u, "-")
  end
end
