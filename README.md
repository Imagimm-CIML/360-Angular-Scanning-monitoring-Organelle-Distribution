# Determining-cell-polarisation-
![test](https://user-images.githubusercontent.com/41480459/186089158-055e6063-6655-4905-8c3a-ea8225ca5416.jpg)

# For that, use the macro (macro_polarisation_polar_dispersion) in order to :
- Binarize your labelling (nucleus and endosomes) and find the centroids
- Calculate the distance and normalize by (feret/2)
- Transform your image in polar image with the plugin polar transform inside the macro
- Calculate the profile in intensity (number of white pixel in the radial image in Y) versus angle
- Normalize your profile in X (shift) and Y (max = 100)
- Make the mean per condition and display the mean curves overlay per condition
- Fit the Y0
