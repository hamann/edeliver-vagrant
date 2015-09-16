set -e -x

mkdir -p ~/.secrets/ed

cat << EOF | tee ~/.secrets/ed/prod.config
[
  {ed,
    [
      {'Elixir.Ed.Endpoint',
        [
          {http, [{port, 4000}]},
          {url, [{host, <<"example.com">>}]},
          {cache_static_manifest, <<"priv/static/manifest.json">>},
          {server, true},
          {secret_key_base, <<"SXyyEevkSQt4kUdYWV2nODXWrMKqwDn4fFl5wWM3vVA/U3wv/XjaZa8FqBjODRlW">>},
          {pubsub, [{name, 'Elixir.Ed.PubSub'},{adapter, 'Elixir.Phoenix.PubSub.PG2'}]},
          {root, <<"/home/vagrant/deliver/ed">>}
        ]
      },
      {logger,
        [
          {level, info}
        ]
      },
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
