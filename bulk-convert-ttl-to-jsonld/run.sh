ttl_files=$(find . | grep .ttl)
for ttl_file in $ttl_files
do
  jsonld_file=$(echo $ttl_file | sed 's/.ttl/.jsonld/g')
  sparql --data $ttl_file --query a.rq --results JSON-LD >> $jsonld_file
done
