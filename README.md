# Determining the cell polarisation (endosomes localisation versus nucleus)
![test](https://user-images.githubusercontent.com/41480459/186089158-055e6063-6655-4905-8c3a-ea8225ca5416.jpg)

# Use the macro "polarisation_polar_dispersion.ijm" to :
- Binarize your labelling (nucleus and endosomes) and find the centroids :

![binarize](https://user-images.githubusercontent.com/41480459/186090516-4a8c6b34-f171-43f1-b751-d890f9dccca8.jpg)
- Calculate the distance between centroids and normalize this distance by (feret/2): the value will be between 0 and 1.
- Transform your image in polar image with the plugin polar_transformer.class inside the macro :

![Polar Transform](https://user-images.githubusercontent.com/41480459/186090698-c9b6ac73-9e67-4e7a-acad-1db4ed5c0fc8.jpg)
- Calculate the profile in intensity (number of white pixel in the radial image in Y) versus angle

# Use the jupyter notebook "Polarisation_Profile_Lowess_STD.ipynb" to:
- Use Lowess function to remove high peak (smoothing)
- Normalize your profile in X (shift the max intensity to 0 (angle) and from -180 to 180) and Intensity by the sum to obtain probability
- Make the mean per condition and display the mean curves overlay per condition 
![Superposition](https://user-images.githubusercontent.com/41480459/188651914-3faa98c9-701e-4714-9764-9f3cc5ab49e3.png)
- Calculate the standard deviation for each condition to quantify the dispersion in angle among the mean. As non polarized curved do not go to 0 (ofsset), the std of thius curves should be higher

# optional :
- Bin your profile data by 30 degrees to smooth the curves (the peak maximum is originally too high due to high local maximum value)
- Fit the curves with a Gaussian to determine the Y0 per condition (angle = 180 degrees) to obtain a quantification of polarisation from these curves
(If the offset is low, the polarisation is high).

