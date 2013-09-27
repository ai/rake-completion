#!/bin/bash
# Bash completion support for Rake, Ruby Make.

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_rakecomplete() {
    rakefile=`find . -maxdepth 1 -iname Rakefile`
    if [ "$rakefile" != "" ]; then
        recent=`ls -t .rake_tasks~ ${rakefile} **/*.rake 2> /dev/null | head -n 1`
        if [[ $recent != '.rake_tasks~' ]]; then
            rake --silent --prereqs | grep "rake" | cut -d " " -f 2 > .rake_tasks~
        fi
        COMPREPLY=($(compgen -W "`cat .rake_tasks~`" -- ${COMP_WORDS[COMP_CWORD]}))
        return 0
    fi
}

complete -o default -o nospace -F _rakecomplete rake
