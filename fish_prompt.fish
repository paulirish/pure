function fish_prompt
    set --local exit_code $status  # save previous exit code

    echo -e -n (_pure_prompt_beginning)  # init prompt context (newline, etc.)
    echo -e (_pure_prompt_first_line)  # print current path, git branch/status, command duration
    echo -e -n (_pure_prompt $exit_code)  # print prompt
    echo -e (_pure_prompt_ending)  # reset colors and end prompt

    set _pure_fresh_session false
end

function in_chromium_repo
  if not git remote get-url origin > /dev/null ^&1
    return
  end
  if [ (git remote get-url origin) = "https://chromium.googlesource.com/chromium/src.git" ]
    true
  else
    false
  end
end
