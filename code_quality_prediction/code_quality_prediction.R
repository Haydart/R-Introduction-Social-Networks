trainOrig = read.csv(file="lucene2.2train.csv", header=TRUE, sep=",")
testOrig = read.csv(file="lucene2.4test.csv", header=TRUE, sep=",")

print(head(trainOrig, n=2))

print(mlr::summarizeColumns(trainOrig))
print(summary(trainOrig))