function jjbm
  jj log -r 'heads(::@ & bookmarks())' --ignore-working-copy --template 'bookmarks' --no-graph | head -n1 | cut -d " " -f1
end
