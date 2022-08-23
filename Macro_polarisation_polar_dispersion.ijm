run("Close All");
// 
path = File.openDialog("open your image");
open(path);
name = getTitle();
print(name);
getPixelSize(unit, pixelWidth, pixelHeight);
rename("test");
Stack.setDisplayMode("composite");
Stack.setActiveChannels("1010");
waitForUser("choose the Z and active the 2 channels dapi and endosomes");
Stack.setChannel(1);
run("Blue");
Stack.setChannel(2);
run("Red");
Stack.setChannel(3);
run("Red");
Stack.setChannel(4);
run("Red");
run("Stack to RGB", "keep");
waitForUser("draw a cell ROI");
setForegroundColor(255, 255, 255);
setBackgroundColor(0, 0, 0);
run("Clear Outside");

// loop all roi i = 0 to n
//roiManager("Select", 0);

run("Duplicate...", " ");
run("Split Channels");
selectWindow("test-1-1 (green)");
close();
selectWindow("test-1-1 (blue)");
rename("noyaux");
selectWindow("test-1-1 (red)");
rename("endosomes");

// select dapi
selectWindow("noyaux");
setAutoThreshold("Huang dark");
setOption("BlackBackground", true);
run("Convert to Mask");
setAutoThreshold("Huang dark");
run("Clear Results");
run("Set Measurements...", "centroid center feret's limit redirect=None decimal=3");
run("Measure");
// get X and Y (n = noyaux)
Xn = getResult("X", 0);
Yn = getResult("Y", 0);
print("Xn="+Xn);
print("Yn="+Yn);

//select endosomes
selectWindow("endosomes");
run("Duplicate...", " ");
setAutoThreshold("Huang dark");
run("Convert to Mask");
setAutoThreshold("Huang dark");
run("Clear Results");
run("Measure");

//get X and Y (e =endosomes)
Xe = getResult("X", 0);
Ye = getResult("Y", 0);
print("Xe="+Xe);
print("Ye="+Ye);

// calculate polar transform
Xn_pixel = Xn/pixelWidth
Yn_pixel = Yn/pixelWidth
run("Polar Transformer", "method=Polar degrees=360 for_polar_transforms, center_x="+Xn_pixel+" center_y="+Yn_pixel);
run("Rotate 90 Degrees Left");

// tous les 10 degrés(en option), on compte le nombre de pixels=255 en Y et on les additionne
getDimensions(width3, height3, channels3, slices3, frames3);
//run("Bin...", "x=10 y=1 bin=Max");
line_intensity_X = newArray(width3);
sum_intensity_Y = 0;
intensity_Y = 0;

for (i=0; i<width3;i++) {
	sum_intensity_Y = 0;
	intensity_Y = 0;	
	for (j=0; j<height3;j++) {
	intensity_Y = getPixel(i, j)/255;
	sum_intensity_Y = sum_intensity_Y+intensity_Y;
	}
line_intensity_X[i] = sum_intensity_Y;
}
Plot.create("Intensity versus angle", "X", "Y", line_intensity_X);
Plot.setLimits(0.0,40.0,0,300);
Plot.show();
waitForUser("save values en cliquant sur list");
// save line intensity

// get Feret
run("Clear Results");
selectWindow("endosomes");
waitForUser("change the threshold to have all the cel to define the cell diameter = Feret ?");
run("Convert to Mask");
setAutoThreshold("Huang dark");
run("Measure");
feret = getResult("Feret", 0);
feret = feret*pixelWidth;
print("Feret="+feret);
run("Clear Results");

// calcul distance entre centroides
distance = sqrt( (Xn-Xe)*(Xn-Xe)+(Yn-Ye)*(Yn-Ye) );

// normalise by Feret/2
distance_N = distance/(feret/2);

print ("distance ="+distance);
print ("normalized distance ="+distance_N);

//close all;
run("Close All");