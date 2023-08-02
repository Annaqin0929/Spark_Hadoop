# Python and pyspark modules required

import sys

from pyspark import SparkContext
from pyspark.sql import SparkSession


# Required to allow the file to be submitted and run using spark-submit instead
# of using pyspark interactively

spark = SparkSession.builder.getOrCreate()
sc = SparkContext.getOrCreate()

# Word counts

name = "abc123"

data_path = f"hdfs:///data/helloworld"
word_counts_path = f"hdfs:///user/{name}/word-count-spark-shell"

data = sc.textFile(data_path)

word_counts = (
    data
    .flatMap(lambda line: line.split(" "))
    .map(lambda word: (word, 1))
    .reduceByKey(lambda x, y: x + y)
)

word_counts.saveAsTextFile(word_counts_path)

word_counts.collect()
