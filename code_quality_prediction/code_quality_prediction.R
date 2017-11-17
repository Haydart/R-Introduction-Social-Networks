#trainOrig = read.csv(file="lucene2.2train.csv", header=TRUE, sep=",")
#testOrig = read.csv(file="lucene2.4test.csv", header=TRUE, sep=",")

print(head(trainOrig, n=2))

print(mlr::summarizeColumns(trainOrig))
print(summary(trainOrig))

par(mfrow=c(1,4))
  for(i in 5:8) {
    boxplot(trainOrig[,i], mai=names(trainOrig)[i])
  }

iv <- trainOrig[,5:8] # traits
dv <- trainOrig[,29] #isBuggy

# plot the trait features
caret::featurePlot(x=iv, y=as.factor(dv), plot="box", scales=list(x=list(relation="free"), y=list(relation="free")))

# summarize the dv (isBuggy) distribution

percentage <- prop.table(table(trainOrig$isBuggy)) * 100
cbind(freq=table(trainOrig$isBuggy), percentage=percentage)

# data cleaning - concat train & test to only clean once
train <-trainOrig %>% mutate(dataset="train")
test <- testOrig %>% mutate(dataset="test")

combined <- dplyr::bind_rows(train, test)

# print the data of combined train & test series
print(mlr::summarizeColumns(combined) %>% knitr::kable(digits=2))

combined <- combined %>% select (-c(X, Project, Version, Class))

# delete columns unused for prediction
print(mlr::summarizeColumns(combined) %>% knitr::kable(digits=2))

# missing values imputation based on mean values
imp <- impute(
  combined,
  classes = list(
    factor = imputeMode(), integer = imputeMean(), numeric = imputeMean()
  )
)

combined <- imp$data

# now there are no empty cells
print(summarizeColumns(combined) %>% knitr::kable(digits=2))

#normalize traits for better prediction
combined <- normalizeFeatures(combined, target="isBuggy") # target (isBuggy) cannot be normalized, wouldn't make any sense
print(summarizeColumns(combined) %>% knitr::kable(digits=2))

#finish data processing, split train & test once again for prediction process & delete "dataset"
train <- combined %>% filter(dataset=="train") %>% select(-(dataset))
test <- combined %>% filter(dataset=="test") %>% select(-(dataset)) 
print(summarizeColumns(train) %>% knitr::kable(digits=2))

# Build prediction model
# Specify the prediction task
trainTask <- makeClassifTask(data=train, target="isBuggy", positive = "TRUE")
print(trainTask)

