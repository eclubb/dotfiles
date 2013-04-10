# Colorized, paginated, diff. Accepts same args as normal diff.
cdiff() {
  colordiff -u -p $* | less -R
}

# autocorrect is more annoying than helpful
unsetopt correct_all
