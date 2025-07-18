__wp_local_base_path() {
  local locale=$1
  local base_path="$HOME/Projects/spacious-blogs"
  echo "$base_path"
}

__wp_remote_host() {
  local locale=$1
  local host
  local user="bitnami"

  case $locale in
  en)
    host="en-blog-staging"
    ;;
  zh-tw)
    host="zh-blog-staging"
    ;;
  esac
  echo $host
}

__wp_remote_base_path() {
  local locale=$1
  local host
  local user="bitnami"

  case $locale in
  en)
    host="en-blog-staging"
    ;;
  zh-tw)
    host="zh-blog-staging"
    ;;
  esac
  echo "$user@$host:/opt/bitnami"
}

# given a file / use git files deploy it the remote wp server
wp() {
  # going to project root to ensure path correctness
  local cwd=$(pwd)
  echo "Going to project base path"
  cd $(__wp_local_base_path)

  # this has several modes depending on $1
  # a to deploy all wp-content files
  # b to deploy all modified files compared to a given branch
  # g to deploy all dirty files
  # otherwise track $1 as file name
  local files
  case $1 in
  a)
    echo "Deploying all wp-content files"
    local template_files=($(find wordpress/zh-tw/current/wp-content/themes/twentyseventeen-child/templates -type f))
    local code_files=($(find wordpress/zh-tw/current/wp-content/themes/twentyseventeen-child -maxdepth 1 -type f \( -name '*.css' -o -name '*.php' \)))
    local js_files=($(find wordpress/zh-tw/current/wp-content/themes/twentyseventeen-child/js -type f | grep custom))
    files=("${template_files[@]}" "${code_files[@]}" "${js_files[@]}")
    ;;
  b)
    local branch="dev"
    if [[ ! -z $2 ]]; then
      branch=$2
    fi
    echo "Deploying all modified files compared to the $branch branch"
    files=($(git diff --name-only $branch))
    ;;
    # this is also the default mode with no $1 supplied
  g)
    echo "Deploying all modified files in git"
    files=($(git ls-files -m))
    ;;
  h)
    echo "wordpress deployment helper (wp):"
    echo "a: Deploy all wp-content files"
    echo "b \$branch: Deploy all modified files compared to a given branch"
    echo "g: Deploy all modified files in git"
    echo "\$file: Deploy this file only"
    return
    ;;
  *)
    files=($1)
    # if no files are supplied, use git files
    if [[ -z $files ]]; then
      echo "Deploying all modified files in git"
      files=($(git ls-files -m))
    fi
    ;;
  esac

  # Do not deploy any dotfile
  # files=$(printf "%s\n" "${files[@]}" | rg -v '^\.')

  # choose what files to deploy, if empty use git files
  echo "Files to be deploy are:"
  for file in ${files[@]}; do
    echo $file
  done
  echo ""

  # decide what locale to deploy
  # do not even try to deploy to mixed locale, will explode
  local locale
  if echo $files[1] | grep "wordpress/en" >/dev/null; then
    locale="en"
  elif echo $files[1] | grep "wordpress/zh-tw" >/dev/null; then
    locale="zh-tw"
  fi

  echo "Will deploy to $locale"

  # final confirmation before deploying
  echo "Are you sure to deploy to $(__wp_remote_base_path $locale)"
  local choice

  # confirm before deploying
  read -k 1 -q -s "choice?(y/n)"
  echo "\n"

  case $choice in
  y | Y)
    echo "Begin deploying"
    for file in ${files[@]}; do
      local local_path="$(__wp_local_base_path $locale)/$file"
      local remote_path="$(echo $(__wp_remote_base_path $locale)/$file | sed s/current/blog/)"
      echo "FROM: $local_path"
      echo "  TO: $remote_path"
      scp -r $local_path $remote_path
    done
    ;;
  n | N)
    echo "Abort deploying"
    ;;
  esac

  # return to previous working directory
  cd $cwd
}

# Automate copy a commit to staging, deploying it and switching back
wpc() {
  local from_branch=$(git branch --show-current)
  local to_branch="temp/staging"

  git checkout $to_branch
  git cherry-pick $from_branch
  wp b HEAD^
  git checkout $from_branch
}
