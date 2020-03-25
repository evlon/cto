echo -n [ >.cache
for i in $(find ./ -name .url);  
    do echo -n '{"f":"'$(echo $i | sed 's/^\.\///' | sed 's/\/\.url$//')'","info":'$(cat $i)'},' >> .cache ;
done 
cat .cache | sed 's/,$//' > .cache.json 
echo -n ] >> .cache.json
rm .cache
