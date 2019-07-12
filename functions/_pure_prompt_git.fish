function _pure_prompt_git \
    --description 'Print git repository informations: branch name, dirty, upstream ahead/behind'

    set --local is_git_repository (command git rev-parse --is-inside-work-tree 2>/dev/null)

    # exit early if we're not in a repo
    if not test -n "$is_git_repository"; return; end;

    set --local git_prompt (_pure_prompt_git_branch)

    # early exit for Chromium repo, as the dirty check takes ~5s
    # see other Chromium repo hacking optimizations: https://github.com/paulirish/dotfiles/blob/master/setup-a-new-machine.sh#L214
    set --local repoUrl (git config --get remote.origin.url)
    if echo $repoUrl | grep "chromium.googlesource.com" -q
      echo "$git_prompt$pure_color_git_dirty ⁂"
      return
    end

  
    set git_prompt $git_prompt(_pure_prompt_git_dirty)
    set --local git_pending_commits (_pure_prompt_git_pending_commits)

    if test (_pure_string_width $git_pending_commits) -ne 0
        set git_prompt $git_prompt $git_pending_commits
    end
    echo $git_prompt
end

