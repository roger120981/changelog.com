defmodule Changelog.SponsorRep do
  use Changelog.Schema

  alias Changelog.{Person, Sponsor}

  schema "sponsor_reps" do
    field :delete, :boolean, virtual: true

    belongs_to :sponsor, Sponsor
    belongs_to :rep, Person

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, ~w(rep_id sponsor_id delete)a)
    |> foreign_key_constraint(:rep_id)
    |> foreign_key_constraint(:sponsor_id)
    |> mark_for_deletion()
  end
end
