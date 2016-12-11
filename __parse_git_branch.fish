function __parse_git_branch -d "Output git's current branch name"
  begin
    git symbolic-ref --quiet --short HEAD; or \
    git describe --all --exact-match HEAD; or \
    git rev-parse --short HEAD; or '(unknown)'
  end ^/dev/null | sed -e 's|^refs/heads/||'
end
