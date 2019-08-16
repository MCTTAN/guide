
# Advanced Image-Processing in R
# https://cran.r-project.org/web/packages/magick/vignettes/intro.html

library(EBImage)
library(keras)
library(magick)
library(imager)

library(abind)
library(reticulate)
library(parallel)
library(doParallel)
library(foreach)
library(doMC)

# install_keras(method = c("auto", "virtualenv", "conda"),
#               conda = "auto", version = "default", tensorflow = "default",
#               extra_packages = c("tensorflow-hub"))





### Reading a PDF document
# Each page becomes an element of the vector
# manual <- image_read_pdf('https://cloud.r-project.org/web/packages/magick/magick.pdf', density = 72)
# image_info(manual)
# manual[1]

### DRAWING ON TOP OF IMAGES
# img <- image_draw(frink)
# rect(20, 20, 200, 100, border = "red", lty = "dashed", lwd = 5)
# abline(h = 300, col = 'blue', lwd = '10', lty = "dotted")
# text(30, 250, "Hoiven-Glaven", family = "monospace", cex = 4, srt = 90)
# palette(rainbow(11, end = 0.9))
# symbols(rep(200, 11), seq(0, 400, 40), circles = runif(11, 5, 35),
#         bg = 1:11, inches = FALSE, add = TRUE)
# dev.off()
# print(img)
# By default image_draw() sets all margins to 0 
# and uses graphics coordinates to match image size 
# in pixels (width x height) where (0,0) is the 
# top left corner. Note that this means the y axis 
# increases from top to bottom which is the opposite 
# of typical graphics coordinates. You can override 
# all this by passing custom xlim, ylim or mar values 
# to image_draw.

### Animating Images
# image_animate(image_scale(img, "200x200"), fps = 1, dispose = "previous")

### MORPHING IMAGES - ANIMATIONS
# newlogo <- image_scale(image_read("https://jeroen.github.io/images/Rlogo.png"), "x150")
# oldlogo <- image_scale(image_read("https://developer.r-project.org/Logo/Rlogo-3.png"), "x150")
# frames <- image_morph(c(oldlogo, newlogo), frames = 10)
# image_animate(frames)

### Reading an existing GIF or video file !!!!!!!!!!!
# banana <- image_read("https://jeroen.github.io/images/banana.gif")
# banana <- image_scale(banana, "150")
# image_info(banana)

### Manipulate the individual frames and put them back into an animation
# # Background image
# background <- image_background(image_scale(logo, "200"), "white", flatten = TRUE)
# 
# # Combine and flatten frames
# frames <- image_composite(background, banana, offset = "+70+30")
# 
# # Turn frames into animation
# animation <- image_animate(frames, fps = 10)
# print(animation)
# image_write(animation, "Rlogo-banana.gif")

# frink <- image_read("https://jeroen.github.io/images/frink.png")
# image_trim(frink)
# image_scale(frink, "200x200")
# image_flip(frink)
# image_flop(frink)
# image_rotate(frink, 45) ## <-- result of this is shown
# image_negate(frink)
# frink %>% 
#   image_background("green") %>% 
#   image_flatten() %>%
#   image_border("red", "10x10")
# image_border(image_background(frink, "hotpink"), "#000080", "20x10")
# image_scale(frink, "300") # width: 300px
# image_scale(frink, "x300") # height: 300px
# image_modulate(frink, brightness = 80, saturation = 120, hue = 90)
# image_fill(frink, "orange", point = "+100+200", fuzz = 20)
# image_blur(frink)
# image_blur(frink, 10, 5)
# image_noise(frink)
# image_oilpaint(frink)
# image_convolve(frink)
# img %>% image_convolve(frink) %>% image_negate()
# image_implode(frink)
# image_charcoal(frink)
# image_edge(frink)
# image_charcoal(frink) %>% image_write("/cloud/project/exported/frink-charcoal.png")
# image_annotate(frink, "I like R!", size = 70, gravity = "southwest", color = "green")
# image_annotate(frink, "CONFIDENTIAL", size = 30, color = "red", boxcolor = "pink", degrees = 60, location = "+50+100")
# image_annotate(frink, "The quick brown fox", font = 'Times', size = 30)
# Supported fonts: sans, mono, serif, Times, Heveltica, Trebuchet, Georgia, Palatino, Comic Sans

# tiger <- image_read("http://jeroen.github.io/images/tiger.svg")
# print(tiger)
# image_trim(tiger)
# image_scale(tiger, "200x200")
# image_flip(tiger)
# image_rotate(tiger, 45)
# image_negate(tiger)
# tiger %>%
#   image_background("green") %>%
#   image_flatten() %>%
#   image_border("red", "10x10")

### image_write(tiger, path = "tiger.png", format = "png")
### tiger_png <- image_convert(tiger, "png")
### image_info(tiger_png)

### Creating Layers (Like Photoshop)!
# bigdata <- image_read('https://jeroen.github.io/images/bigdata.jpg')
# frink <- image_read("https://jeroen.github.io/images/frink.png")
# logo <- image_read("https://jeroen.github.io/images/Rlogo.png")
# img <- c(bigdata, logo, frink)
# img <- image_scale(img, "300x300")
# image_info(img)
# image_mosaic(img)
# Flattening combines the layers into a single image,
# which has the size of the first image.
# image_flatten(img)
# image_flatten(img, 'Add')
# image_flatten(img, 'Modulate')
# image_flatten(img, 'Minus')
### Put frames next to each other
# image_append(image_scale(img, "x200"))
### Put frames on top of each other
# image_append(image_scale(img, "100"), stack = TRUE)
### Composing allows for combining two images on a specific position
# bigdatafrink <- image_scale(image_rotate(image_background(frink, "none"), 300), "x200")
# image_composite(image_scale(bigdata, "x400"), bigdatafrink, offset = "+180+100")







