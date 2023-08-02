import sys

from pyspark import SparkContext
from pyspark.sql import SparkSession


# Required to allow the file to be submitted and run using spark-submit instead
# of using pyspark interactively

spark = SparkSession.builder.getOrCreate()
sc = SparkContext.getOrCreate()

# Character counts

data_path = sys.argv[1]
char_counts_path = sys.argv[2]

data = sc.textFile(data_path)

char_counts = (
    data
    .flatMap(lambda line: list(line))  # Split each line into individual characters
    .map(lambda char: (char, 1))  # Map each character to a tuple (character, 1)
    .reduceByKey(lambda x, y: x + y)  # Reduce by key (character) by summing the counts
)

char_counts.saveAsTextFile(char_counts_path)

