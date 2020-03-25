if [ ! -d cache ] ;then mkdir cache;fi
git remote rm origin
git remote add orgin "https://${username}:${password}@github.com/${username}/${repositoryName}.git"

echo -n [ > cache/.cache
for i in $(find ./ -name .url);  
    do echo -n '{"f":"'$(echo $i | sed 's/^\.\///' | sed 's/\/\.url$//')'","info":'$(cat $i)'},' >> cache/.cache ;
done 
cat cache/.cache | sed 's/,$//' > cache/.cache.json 
echo -n ] >> cache/.cache.json
rm cache/.cache

git push github `git subtree split --prefix cache master`:gh-pages --force

