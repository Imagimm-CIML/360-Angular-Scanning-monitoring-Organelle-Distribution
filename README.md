# Determining-cell-polarisation-
![test](https://user-images.githubusercontent.com/41480459/186089158-055e6063-6655-4905-8c3a-ea8225ca5416.jpg)

# For that, use the macro (macro_polarisation_polar_dispersion) in order to :
- Binarize your labelling (nucleus and endosomes) and find the centroids :
![binarize](https://user-images.githubusercontent.com/41480459/186090516-4a8c6b34-f171-43f1-b751-d890f9dccca8.jpg)
- Calculate the distance and normalize by (feret/2)
- Transform your image in polar image with the plugin polar transform inside the macro :
![Polar Transform](https://user-images.githubusercontent.com/41480459/186090698-c9b6ac73-9e67-4e7a-acad-1db4ed5c0fc8.jpg)

- Calculate the profile in intensity (number of white pixel in the radial image in Y) versus angle
- Normalize your profile in X (shift) and Y (max = 100) with the jupyter notebook
- Make the mean per condition and display the mean curves overlay per condition Polarisation_Profile_FitY0.ipynb
![Superposition](https://user-images.githubusercontent.com/41480459/186090896-6e5dda47-307e-40e4-9a88-d1c4cdd77330.png)
- Fit the Y0
