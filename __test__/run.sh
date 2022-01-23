set -x
printenv
which diff-highlight
diff-highlight < /dev/null && echo success
