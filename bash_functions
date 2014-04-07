# Functions
#
# Some example functions:
#
# a) function settitle
# settitle ()
# {
#   echo -ne "\e]2;$@\a\e]1;$@\a";
# }
#
# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
cd_func ()
{
    local x2 the_new_dir adir index
        local -i cnt

        if [[ $1 ==  "--" ]]; then
            dirs -v
                return 0
                fi

                the_new_dir=$1
                [[ -z $1 ]] && the_new_dir=$HOME

                if [[ ${the_new_dir:0:1} == '-' ]]; then
#
# Extract dir N from dirs
                    index=${the_new_dir:1}
    [[ -z $index ]] && index=1
        adir=$(dirs +$index)
        [[ -z $adir ]] && return 1
        the_new_dir=$adir
        fi

#
# '~' has to be substituted by ${HOME}
        [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"

#
# Now change to the new dir and add to the top of the stack
        pushd "${the_new_dir}" > /dev/null
        [[ $? -ne 0 ]] && return 1
        the_new_dir=$(pwd)

#
# Trim down everything beyond 11th entry
        popd -n +11 2>/dev/null 1>/dev/null

#
# Remove any other occurence of this dir, skipping the top of the stack
        for ((cnt=1; cnt <= 10; cnt++)); do
            x2=$(dirs +${cnt} 2>/dev/null)
                [[ $? -ne 0 ]] && return 0
                [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
                if [[ "${x2}" == "${the_new_dir}" ]]; then
                    popd -n +$cnt 2>/dev/null 1>/dev/null
                        cnt=cnt-1
                        fi
                        done

                        return 0
}

alias cd=cd_func

# Creates a directory if it does not exist already and gets into it.
mkdir_cd() {
    DIR="$1"
        if [[ ! -d "$DIR" ]]; then
            mkdir "$DIR"
                fi
                cd "$DIR"
}

# Creates a symbolic link to the target in the current folder if it does not
# exist already.
mklink() {
    TARGET="$1"
        BASE=`basename "$TARGET"`
        if [[ ! -h "$BASE" ]]; then
            ln -s "$TARGET" "$BASE"
                fi
}

# SSH helper functions
function add_ssh() {
    about 'add entry to ssh config'
        param '1: host'
        param '2: hostname'
        param '3: user'
        group 'ssh'
        echo -en "\n\nHost $1\n  HostName $2\n  User $3\n  ServerAliveInterval 30\n  ServerAliveCountMax 120" >> ~/.ssh/config
}

function sshlist() {
    about 'list hosts defined in ssh config'
        group 'ssh'
        awk '$1 ~ /Host$/ { print $2 }' ~/.ssh/config
}

# Git
function git_remote {
    about 'adds remote $GIT_HOSTING:$1 to current repo'
        group 'git'

        echo "Running: git remote add origin ${GIT_HOSTING}:$1.git"
        git remote add origin $GIT_HOSTING:$1.git
}

function git_first_push {
    about 'push into origin refs/heads/master'
        group 'git'

        echo "Running: git push origin master:refs/heads/master"
        git push origin master:refs/heads/master
}

function git_remove_missing_files() {
    about "git rm's missing files"
        group 'git'

        git ls-files -d -z | xargs -0 git update-index --remove
}

# Adds files to git's exclude file (same as .gitignore)
function local-ignore() {
    about 'adds file or path to git exclude file'
        param '1: file or path fragment to ignore'
        group 'git'
        echo "$1" >> .git/info/exclude
}

# get a quick overview for your git repo
function git_info() {
    about 'overview for your git repo'
        group 'git'

        if [ -n "$(git symbolic-ref HEAD 2> /dev/null)" ]; then
# print informations
            echo "git repo overview"
                echo "-----------------"
                echo

# print all remotes and thier details
                for remote in $(git remote show); do
                    echo $remote:
                        git remote show $remote
                        echo
                        done

# print status of working repo
                        echo "status:"
                        if [ -n "$(git status -s 2> /dev/null)" ]; then
                            git status -s
                        else
                            echo "working directory is clean"
                                fi

# print at least 5 last log entries
                                echo
                                echo "log:"
                                git log -5 --oneline
                                echo

        else
            echo "you're currently not in a git repository"

                fi
}

function git_stats {
    about 'display stats per author'
        group 'git'

# awesome work from https://github.com/esc/git-stats
# including some modifications

        if [ -n "$(git symbolic-ref HEAD 2> /dev/null)" ]; then
            echo "Number of commits per author:"
                git --no-pager shortlog -sn --all
                AUTHORS=$( git shortlog -sn --all | cut -f2 | cut -f1 -d' ')
                LOGOPTS=""
                if [ "$1" == '-w' ]; then
                    LOGOPTS="$LOGOPTS -w"
                        shift
                        fi
                        if [ "$1" == '-M' ]; then
                            LOGOPTS="$LOGOPTS -M"
                                shift
                                fi
                                if [ "$1" == '-C' ]; then
                                    LOGOPTS="$LOGOPTS -C --find-copies-harder"
                                        shift
                                        fi
                                        for a in $AUTHORS
                                            do
                                                echo '-------------------'
                                                    echo "Statistics for: $a"
                                                    echo -n "Number of files changed: "
                                                    git log $LOGOPTS --all --numstat --format="%n" --author=$a | cut -f3 | sort -iu | wc -l
                                                    echo -n "Number of lines added: "
                                                    git log $LOGOPTS --all --numstat --format="%n" --author=$a | cut -f1 | awk '{s+=$1} END {print s}'
                                                    echo -n "Number of lines deleted: "
                                                    git log $LOGOPTS --all --numstat --format="%n" --author=$a | cut -f2 | awk '{s+=$1} END {print s}'
                                                    echo -n "Number of merges: "
                                                    git log $LOGOPTS --all --merges --author=$a | grep -c '^commit'
                                                    done
                                else
                                    echo "you're currently not in a git repository"
                                        fi
}

