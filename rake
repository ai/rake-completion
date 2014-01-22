#!/bin/bash
# Bash completion support for Rake, Ruby Make.

# This messes up COMP_WORDBREAKS throughout the system.
# Fixing it to restrict changes to rakecomplete only.
# export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_rakecomplete() {
    local cur
    _get_comp_words_by_ref -n : cur
    rakefile=`find . -maxdepth 1 -iname Rakefile`
    if [ "$rakefile" != "" ]; then
        recent=`ls -t .rake_tasks~ ${rakefile} **/*.rake 2> /dev/null | head -n 1`
        if [[ $recent != '.rake_tasks~' ]]; then
            rake --silent --prereqs | grep "rake" | cut -d " " -f 2 > .rake_tasks~
        fi
        COMPREPLY=($(compgen -W "`cat .rake_tasks~`" -- "$cur"))
        # remove colon containing prefix from COMPREPLY items
        __ltrim_colon_completions "$cur"
        return 0
    fi
}

complete -o default -o nospace -F _rakecomplete rake
