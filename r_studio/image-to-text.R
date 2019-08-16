library(tesseract)

# You need to have the desktop version of
# RStudio in order to use tesseract!

# https://cran.r-project.org/web/packages/tesseract/vignettes/intro.html

img <- image_read("http://jeroen.github.io/images/testocr.png")
print(img)
cat(image_ocr(img))
# ocr_data() returns all words in the image along with
# a bounding box and confidence rate
# results <- tesseract::ocr_data("http://jeroen.github.io/images/testocr.png", engine = eng)
# results

eng <- tesseract("eng")
text <- tesseract::ocr("http://jeroen.github.io/images/testocr.png", engine = eng)
cat(image_ocr(text))
