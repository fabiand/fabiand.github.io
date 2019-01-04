for F in $(ls -1 ../posts) ;
do
  POSTID=${F%.md}
  NEWFN=$(date --date="$(xmllint --xpath "string(tumblr/posts/post[@id=$POSTID]/@date)" ../posts/posts.xml )" +%Y-%m-%d-$POSTID.md)
  TITLE=$(xmllint --xpath "string(tumblr/posts/post[@id=$POSTID]/regular-title)" ../posts/posts.xml)
  ( echo -e "---\nlayout: post\ntitle: \"${TITLE:-Today}\"\n---\n\n" ; cat ../posts/$F ) > ../_posts/$NEWFN
done
