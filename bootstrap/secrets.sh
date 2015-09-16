set -e -x

mkdir -p ~/.secrets/ed

cat << EOF | tee ~/.secrets/ed/prod.config
[
  {ed,
    [
      {'Elixir.Ed.Repo',
        [
          {adapter,'Ecto.Adapters.Postgres'},
          {username,<<"ed_web">>},
          {password,<<"">>},
          {database,<<"ed_production">>},
          {size,10}
        ]
      }
     ]
  }
].
EOF
