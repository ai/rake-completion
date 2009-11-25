# Bash completion support for Rake, Ruby Make.

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}

_rakecomplete() {
    if [ -f Rakefile ]; then
        COMPREPLY=($(compgen -W "`rake --silent --tasks | cut -d " " -f 2`" -- ${COMP_WORDS[COMP_CWORD]}))
        return 0
    fi
}
 
complete -o default -o nospace -F _rakecomplete rake
