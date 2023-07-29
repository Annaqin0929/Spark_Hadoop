# Compile code

hadoop com.sun.tools.javac.Main WordCount.java
ls -1
jar cvf0 WordCount.jar *.class  # note that *.class will match all class files in the current directory

# Run compiled jar using Hadoop MapReduce

NAME=abc123

hadoop jar WordCount.jar WordCount /data/helloworld/ /user/$NAME/word-count-hadoop/
hdfs dfs -ls /user/$NAME/word-count-hadoop/
hdfs dfs -cat /user/$NAME/word-count-hadoop/part-r-00000

# If you want to run the code again, use the commented out commands below to remove the files you have created
# rm -rf *.class
# hdfs dfs -rm -r -f /user/$NAME/word-count-hadoop*

# If you change your .java code, you need to go back to the beginning to recompile your code into WordCount.jar

# If you just want to run the same .java code, rerun the hadoop jar WordCount.jar ... command