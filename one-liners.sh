#!/bin/bash

# Add to ~/.bash_profile

# pathToOneLiners="~/iOS-Knowledge-Base/one-liners.sh"
# if [ -f $pathToOneLiners ]; then
#   . $pathToOneLiners
# fi

#where ~/iOS-Knowledge-Base/one-liners.sh is path to this file

#print list of braches with time of last commit 
alias list_branch='for k in `git branch|perl -pe s/^..//`;do echo -e `git show --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k|head -n 1`\\t$k;done|sort -r'

#print list of longest files (only *.m files)
alias longest_files='find . -name \*.m -not -path "./Pods/*"  -exec wc -l {} \; | sort | tail'

#print average file length (only *.m files)
alias avg_file_length="find . -name \*.m -not -path './Pods/*'  -exec wc -l {} \; | awk '{ total += \$1; count++} END { print total/count }'"

#print too long files (over 300 lines, only *.m files) 
alias too_long_files="find  . -name \*.m -not -path './Pods/*'  -exec wc -l {} \; | sort | awk 'BEGIN{ count = 0; } { if (\$1 > 300){ print \$0; count++}}  END { print \"    \"  count \" files long over 300 lines\" }'"

#print diff only for *.h and *.m files usage:
#commit_diff HEAD~1 HEAD
function commit_diff() { git diff --name-only  $1 $2 | egrep '(\.h|\.m)' | grep -v ^Pods| xargs git diff --src-prefix="$1/" --dst-prefix="$2/" -w $1 $2 --; }

#giteł
alias such=git
alias very=git
alias wow='git status -s'
