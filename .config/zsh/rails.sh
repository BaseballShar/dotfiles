# Useful rails aliases or functions live here
# alias rs="bundle install; spring stop; rails db:migrate; yarn; git reset --hard; overmind s"

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
