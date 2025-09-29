# Useful rails aliases or functions live here
# alias rs="bundle install; spring stop; rails db:migrate; yarn; git reset --hard; overmind s"

# Auto activate venv if not activated
dp() {
  local PROJ_PATH="$HOME/Projects/spacious-rails"
  local PIP_PATH="$PROJ_PATH/.venv/bin/pip3"
  local ACTIVATE_SCRIPT="$PROJ_PATH/.venv/bin/activate"
  cd $PROJ_PATH
  if [ "$(command -v pip3)" != "$PIP_PATH" ]; then
    echo "Activating venv in spacious-rails"
    source "$ACTIVATE_SCRIPT"
  else
    echo "venv is already activated"
  fi
  echo "pip in $(which pip3)"
  echo "Running deployment script"
  # bundle install
  # Answer 2 for staging, cur for current branch, and yes 4 times to confirm
  # echo -e "2\ncur\ny\ny\ny\ny" | ./bin/deploy
  ./bin/deploy
}

# Check and toggle rails caching options
rcache() {
  local env_file=".env.development.local"
  local key="RAILS_CONFIG_ACTION_CONTROLLER_PERFORM_CACHING_ENABLED_IN_DEVELOPMENT"

  # Find the current cache value
  local current_val=$(grep -E "^${key}=" "$env_file" | cut -d'=' -f2)
  case $1 in
  t | toggle)
    if [ "$current_val" = "true" ]; then
      sed -i '' "s/^${key}=true/${key}=false/" "$env_file"
      echo "Disabled rails caching"
    else
      sed -i '' "s/^${key}=false/${key}=true/" "$env_file"
      echo "Enabled rails caching"
    fi
    ;;
  *)
    echo "Rails caching enabled? $current_val"
    ;;
  esac
}
