# https://tensorflow.rstudio.com/tools/cloudml/articles/getting_started.html
# http://rhappy.fun/blog/hello-keras/index.html

library(EBImage)
library(here)
library(tidyverse)
library(keras)
library(kerasR)
# library(tensorflow)
library(tfdatasets)
library(tfestimators)
library(cloudml)
# use_implementation("tensorflow")
tfe_enable_eager_execution(device_policy = "silent")
# gcloud_install()
# gcloud_init() <- you don't need to execute this, since it was done automatically as part of gcloud_install()

# library(devtools)
# library(rtools)
# library(caret)
# library(httr)
# library(jsonlite)
# library(h2o)
# library(RWeka)
# library(openml-r)
# library(opencv)

# To train a model on CloudML, first work
# the training script locally (perhaps
# with a smaller sample of your dataset).
# The script can contain arbitrary R code
# which trains and/or evaluates a model.
# Once you've confirmed that things work
# as expected, you can submit a CloudML
# job to perform training in the cloud.

mnist <- dataset_mnist()
str(mnist$train)
# The two lists you see are train and test.

train_images <- mnist$train$x
train_labels <- mnist$train$y

# How many dimensions does this tensor have?
length(dim(train_images))

# What shape does this tensor have?
dim(train_images)

# What datatype does this tensor have?
typeof(train_images)

# grab a random index from the "batch" index
# (the first axis)
digit_index <- sample.int(length(train_images[1,,]), 1)
digit <- train_images[digit_index,,]
plot(as.raster(digit, max = 255))

# Reshape
train_images <- array_reshape(train_images, c(60000, 28 * 28))
train_images <- train_images / 255

# Labels
train_labels <- to_categorical(train_labels)

# Set Up A Model
model <- keras_model_sequential() %>%
  layer_dense(units = 512, activation = "relu", input_shape = c(28 * 28),
              name = "image") %>%
  layer_dense(units = 10, activation = "softmax", name = "prediction")
model %>% compile(
  optimizer = "rmsprop",
  loss = "categorical_crossentropy",
  metrics = c("accuracy")
)

# Training
test_images <- mnist$test$x
test_images <- array_reshape(test_images, c(10000, 28 * 28))
test_images <- test_images / 255
test_labels <- mnist$test$y
test_labels <- to_categorical(test_labels)

model

get_layer(model, name="image")
get_weights(model)

# Train
history <- model %>% fit(train_images, train_labels, epochs = 5, batch_size = 128)
# Get a batch of images and the corresponding labels
# Run the layer function on the images
# to obtain predictions on whether the image
# matches the label
# Compute the loss by looking at the rate
# of mismatch between the image and the
# label
# update the weights (how things are
# interconnected/related) to reduce the loss

# Saving the model
write(model_to_yaml(model), "mnist_dense.yaml")
raw_model <- model
write(serialize_model(raw_model), "mnist_raw.txt")
save_model_hdf5(model, filepath = "mnist_dense_hdf5.h5")
save_model_weights_hdf5(model, filepath="mnist_dense_weights_hdf5.h5")

# Validation - see http://rhappy.fun/blog/hello-keras/index.html



setwd('/cloud/project/media/')

image <- readImage('/training/lying-down-1.jpg')
