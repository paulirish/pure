
function __maybe_toggle_dirtystate -d "Ignore dirty state if we're in the huge Chromium repo"
    # check if we're in a git repo. (fast)
    if not git rev-parse --is-inside-work-tree >/dev/null 2>&1
      return
    end
    set -l actualurl (git config --get remote.origin.url)
    switch $actualurl
      case "*chromium.googlesource.com*"
        git config bash.showDirtyState false
    end
end