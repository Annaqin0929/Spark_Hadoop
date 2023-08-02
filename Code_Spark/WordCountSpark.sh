# Start jupyter session on mathmadslinux2p, open and run WordCount.ipynb notebook interactively 

start_pyspark_notebook

# Run pyspark shell interactively, copy and paste code from WordCountShell.py by hand

start_pyspark_shell

# Submit WordCount.py script to spark to run programmatically 

NAME=abc123

submit_pyspark_script "WordCount.py hdfs:///data/helloworld hdfs:///user/$NAME/word-count-spark"
hdfs dfs -ls /user/$NAME/word-count-spark/
hdfs dfs -cat /user/$NAME/word-count-spark/*

# Clean up

hdfs dfs -rm -R /user/$NAME/word-count-spark/
