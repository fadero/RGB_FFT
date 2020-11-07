//return current image to "image" variable
image = getImageID();
originalimage = getTitle();

//check if image is RGB. if not, exit.
if (bitDepth() != 24) 
	exit ("Error: RGB Color image required."); 

//duplicate the image and split the RGB channels
run("Duplicate...", " ");
selectWindow(originalimage);
run("Split Channels");

//FFT each color channel individually, then close the channel image
selectWindow(originalimage + " (red)");
run("FFT");
selectWindow(originalimage + " (red)");
close();

selectWindow(originalimage + " (green)");
run("FFT");
selectWindow(originalimage + " (green)");
close();

selectWindow(originalimage + " (blue)");
run("FFT");
selectWindow(originalimage + " (blue)");
close();

//merge the single-channel FFT, rename it
run("Merge Channels...", "c1=[FFT of "+originalimage+" (red)] c2=[FFT of "+originalimage+" (green)] c3=[FFT of "+originalimage+" (blue)] keep");
rename('RGB FFT of ' + originalimage);
