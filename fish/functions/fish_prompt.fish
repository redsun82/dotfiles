function fish_prompt
    set -l last_status $status

    set -l normal (set_color normal)
    set -l usercolor (set_color $fish_color_user)

    set -l status_color (set_color green)
    if [ $last_status != 0 ]
        set status_color (set_color $fish_color_error)
    end
    set -l delim " \$ "

    fish_is_root_user; and set delim " # "

    set -l cwd (set_color $fish_color_cwd)
    if command -sq sha256sum
        # randomized cwd color
        set -l shas (pwd -P | sha256sum | string sub -l 6 | string match -ra ..)
        # Increase color a bit so we don't get super dark colors.
        # Really we want some contrast to the background (assuming black).
        set -l col (for f in $shas; math --base=hex "min(255, 0x$f + 0x30)"; end | string replace 0x '' | string pad -c 0 -w 2 | string join "")

        set cwd (set_color $col)
    end

    # Only show host if in SSH or container
    # Store this in a global variable because it's slow and unchanging
    if not set -q prompt_host
        set -g prompt_host ""
        if set -q SSH_TTY
            or begin
                command -sq systemd-detect-virt
                and systemd-detect-virt -q
            end
            set -l host (hostname)
            set prompt_host $usercolor$USER$normal@(set_color $fish_color_host)$host$normal":"
        end
    end

    # Shorten pwd if prompt is too long
    set -l max (math --scale 0 (tput cols) / 3)
    if [ $max -gt 40 ]
        set max 40
    end
    set -g fish_prompt_pwd_dir_length 0
    set -l pwd (prompt_pwd)
    set -l w (string length $pwd)
    if [ $w -le $max ]
      set pwd (string pad -w $max $pwd)
    else
      set w (math --scale 0 $w - $max + 2)
      set pwd \U2026(string sub -s $w $pwd)
    end

    echo -n -s $prompt_host $cwd $pwd $status_color $delim $normal
end
