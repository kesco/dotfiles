function man --wraps man --description 'Format and display manual pages'
    set -x LESS_TERMCAP_mb (printf "\e[1;31m")  
    set -x LESS_TERMCAP_md (printf "\e[1;34m")  
    set -x LESS_TERMCAP_me (printf "\e[0m")  
    set -x LESS_TERMCAP_se (printf "\e[0m")  
    set -x LESS_TERMCAP_so (printf "\e[01;45;37m")  
    set -x LESS_TERMCAP_ue (printf "\e[0m")  
    set -x LESS_TERMCAP_us (printf "\e[01;36m")  
    set -lx LESS '-R -s'
    set -lx GROFF_NO_SGR yes # For Konsole

    set -lx MANPATH (string join : $MANPATH)
    if test -z "$MANPATH"
        type -q manpath
        and set MANPATH (command manpath)
    end

    # Check data dir for Fish 2.x compatibility
    set -l fish_data_dir
    if set -q __fish_data_dir
        set fish_data_dir $__fish_data_dir
    else
        set fish_data_dir $__fish_datadir
    end

    set -l fish_manpath (dirname $fish_data_dir)/fish/man
    if test -d "$fish_manpath" -a -n "$MANPATH"
        set MANPATH "$fish_manpath":$MANPATH
        command man $argv
        return
    end
    command man $argv
end
