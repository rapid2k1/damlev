#make debug && valgrind --track-origins=yes --leak-check=full --leak-resolution=high bin/mysqldamlevlim.so

echo "running performance test"

for run in {1..30};
do
echo -n .
mysql warez -e "SELECT SQL_NO_CACHE now(),id,word,type,damlevlim(word,'hataraxiada',255) AS cuenta,score FROM lxk_lexicon WHERE damlevlim(word,'hataraxiada',255)<=4 ORDER BY cuenta, score desc LIMIT 10;" > /dev/null
done

echo
echo "old     0m34.461s"
echo "old     0m16.705s"
echo "current 0m15.962s"

# profiling code
#valgrind --tool=callgrind bin/mysqldamlev.so
#callgrind_annotate --inclusive=yes --tree=both --auto=yes callgrind.out.916
