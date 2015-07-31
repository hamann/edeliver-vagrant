set -e -x

POSTGRES_VERSION="9.4"
DB_NAME="ed_production"
DB_USER="ed_web"

sudo su -c 'echo "deb     http://apt.postgresql.org/pub/repos/apt jessie-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

sudo apt-get update
sudo apt-get install postgresql-$POSTGRES_VERSION postgresql-server-dev-$POSTGRES_VERSION postgresql-contrib-$POSTGRES_VERSION -y --force-yes

sudo -u postgres createuser -d -s $DB_USER
sudo -u postgres createdb -E UTF8 $DB_NAME -l en_US.UTF-8 -T template0 -O $DB_USER

cat << EOF | sudo tee /etc/postgresql/$POSTGRES_VERSION/main/postgresql.conf
data_directory = '/var/lib/postgresql/$POSTGRES_VERSION/main'
hba_file = '/etc/postgresql/$POSTGRES_VERSION/main/pg_hba.conf'
ident_file = '/etc/postgresql/$POSTGRES_VERSION/main/pg_ident.conf'
external_pid_file = '/var/run/postgresql/$POSTGRES_VERSION-main.pid'
listen_addresses = '*'
port = 5432
max_connections = 100
unix_socket_directories = '/var/run/postgresql'
ssl = false
shared_buffers = 512MB
dynamic_shared_memory_type = posix
log_line_prefix = '%t [%p-%l] %q%u@%d '
log_timezone = 'UTC'
stats_temp_directory = '/var/run/postgresql/$POSTGRES_VERSION-main.pg_stat_tmp'
datestyle = 'iso, mdy'
synchronous_commit = on
fsync = on
checkpoint_segments = 64
checkpoint_completion_target = 0.9
checkpoint_timeout = 300
timezone = 'UTC'
lc_messages = 'en_US.UTF-8'
lc_monetary = 'en_US.UTF-8'
lc_numeric = 'en_US.UTF-8'
lc_time = 'en_US.UTF-8'
default_text_search_config = 'pg_catalog.english'
log_min_duration_statement = 200
EOF

cat << 'EOF' | sudo tee /etc/postgresql/$POSTGRES_VERSION/main/pg_hba.conf
local all all trust
host all all ::1/128 trust
host all all 0.0.0.0/0 trust
EOF

sudo /etc/init.d/postgresql restart
