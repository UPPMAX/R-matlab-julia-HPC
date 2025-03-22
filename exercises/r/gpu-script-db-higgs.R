# Inspired by the benchmarking of Anatoly Tsyplenkov:
# https://anatolii.nz/posts/2024/xgboost-gpu-r
#     step 00: Download the HIGGS.zip file: wget https://archive.ics.uci.edu/static/public/280/higgs.zip 
#     step 0: Install these packages if you haven't done it
#install.packages(c("xgboost", "data.table", "tictoc"))
library(xgboost)
library(data.table)
library(tictoc)

#     step 1: Extract the ZIP file (if not already extracted)
#unzip("higgs.zip")  # Extracts to the current working directory

#     step 2: Read the CSV file
higgs_data <- fread("HIGGS.csv")  # Reads large datasets efficiently

#     step 3: Preprocess Data
# The first column is the target (0 or 1), the rest are features
X <- as.matrix(higgs_data[, -1, with = FALSE])  # Remove first column
y <- as.integer(higgs_data$V1)  # Target column

# Train-test split (75% train, 25% test)
set.seed(111)
N <- nrow(X)
train_idx <- sample.int(N, N * 0.75)

dtrain <- xgb.DMatrix(X[train_idx, ], label = y[train_idx])
dtest <- xgb.DMatrix(X[-train_idx, ], label = y[-train_idx])
evals <- list(train = dtrain, test = dtest)

#     step 4: Define XGBoost Parameters
param <- list( objective = "binary:logistic", eval_metric = "error",
   eval_metric = "logloss", max_depth = 6, eta = 0.1)

#     step 5: Train on CPU
tic()
xgb_cpu <- xgb.train( params = param, data = dtrain, watchlist = evals,
nrounds = 10000, verbose = 0, tree_method = "hist")
toc()

#     step 6: Train on GPU
tic()
xgb_gpu <- xgb.train( params = param, data = dtrain, watchlist = evals,
nrounds = 10000, verbose = 0, tree_method = "hist", device = "cuda")
toc()

# Print models
print(xgb_cpu)
print(xgb_gpu)
