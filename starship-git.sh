#!/bin/zsh

# A custom command for Starship (https://starship.rs) to display the git branch state

# for large repos where `git status` is slow, set `known-status = true` under a `[starship]` block in `.git/config` in the repo.
known_status_only=$(git config --get starship.known-status)

# get details of what's changed in the repo
conflicted=0
deleted=0
modified=0
renamed=0
staged=0
untracked=0

if [[ $known_status_only != 'true' ]]; then
    while read -r line
    do
        if [[ $line =~ '^u ' ]]; then # conflict
            conflicted=1
        elif [[ $line =~ '^1 \.D' || $line =~ '^1 D' ]]; then # deleted
            deleted=1
        elif [[ $line =~ '^1 \.[MA]' ]]; then # modified
            modified=1
        elif [[ $line =~ '^2 ' ]]; then # renamed
            renamed=1
        elif [[ $line =~ '^1 [MA]' ]]; then # staged
            staged=1
        elif [[ $line =~ '^\?' ]]; then # untracked
            untracked=1
        fi
    done < <(git status --branch --porcelain=2 --no-ahead-behind 2>/dev/null)
else    # fast known-status only
    # first, loop over staged changes, in the index
    while read -r line
    do
        if [[ $line =~ '^D' ]]; then # conflict
            deleted=1
        elif [[ $line =~ '^A' ]]; then # added
            staged=1
        elif [[ $line =~ '^M' ]]; then # modified
            modified=1
        fi
        if [[ $modified == 1 && $staged == 1 ]]; then
            break   # no need to continue looping (not considering deleted since the other two will take precedence anyway)
        fi
    done < <(git diff-index --name-status HEAD -- 2>/dev/null)

    # first, loop over staged changes, in the index
    if [[ $modified == 0 ]]; then   # only if we haven't already found a modified file
        while read -r line
        do
            if [[ $line =~ '^M' ]]; then # modified
                modified=1
                break
            fi
        done < <(git diff-files --name-status -- 2>/dev/null)
    fi
fi

# if any of those is non-zero, we'll report the change
total_changes=$(($deleted + $modified + $renamed))

# The symbol to report next to the branch name

symbol=''
if [[ $deleted != 0 && $modified == 0 && $renamed == 0 ]]; then # only deleted files
    symbol='✘'
elif [[ $deleted == 0 && $modified == 0 && $renamed != 0 ]]; then # only moved/renamed files
    symbol='»'
elif [[ $total_changes != 0 ]]; then  # if there are multiple types of *unstaged change*, report only '*'
    symbol='*'
elif [[ $staged != 0 ]]; then   # if there are no unstaged changes, but there are staged files, report '+'
    symbol='+'
elif [[ $untracked != 0 ]]; then   # if there are no changes to report, but there are unknown files, report '?'
    symbol='?'
fi

echo -n $symbol
