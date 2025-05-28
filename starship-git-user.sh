#!/bin/zsh

# A custom command for Starship (https://starship.rs) to display the current git user

git_email=$(git config --get user.email | perl -pe 'chomp if eof')

# print out the character indexed by the current user email address
letter=$STARSHIP_GIT_USERS[$git_email]
if [[ $letter == '' ]]; then    # show "ː" if no user is found
  letter='\u02d0'
fi
echo -n "${letter}"
