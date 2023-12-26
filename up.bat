git checkout --orphan new
git add -A
git commit -am "update"
git branch -D master
git branch -m master
git push -f origin master
git push origin --delete new