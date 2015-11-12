defmodule Ed.Repo.Migrations.AddTestTable do
  use Ecto.Migration

  def change do
    create table(:test) do
      add :name, :map
    end
  end
end
