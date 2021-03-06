# Load personal IEx config

import_file_if_available("~/.iex.exs")

import_if_available(Ecto.Query)

alias Rumbl.Repo

IEx.configure(
  history_size: 1000,
  inspect: [
    pretty: true,
    limit: :infinity,
    charlists: :as_lists
  ],
  colors: [
    syntax_colors: [
      number: :light_yellow,
      atom: :light_cyan,
      string: :light_black,
      boolean: :red,
      nil: [:magenta, :bright]
    ],
    ls_directory: :cyan,
    ls_device: :yellow,
    doc_code: :green,
    doc_inline_code: :magenta,
    doc_headings: [:cyan, :underline],
    doc_title: [:cyan, :bright, :underline]
  ]
)

alias Rumbl.Multimedia.{Category, Video}
alias Rumbl.Repo
