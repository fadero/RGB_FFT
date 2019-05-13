//return current image to "image" variable
image = getImageID();

//check if image is RGB. if not, exit.
if (bitDepth() != 24) 
	exit ("8 bit image required."); 

//duplicate the image and split the RGB channels
run("Duplicate...", " ");
imageTitle = getTitle();
run("Split Channels");

selectWindow(imageTitle + " (red)");
run("FFT");
selectWindow(imageTitle + " (red)");
close();

selectWindow(imageTitle + " (green)");
run("FFT");
selectWindow(imageTitle + " (green)");
close();

selectWindow(imageTitle + " (blue)");
run("FFT");
selectWindow(imageTitle + " (blue)");
close();

run("Merge Channels...", "c1=[FFT of "+imageTitle+" (red)] c2=[FFT of "+imageTitle+" (green)] c3=[FFT of "+imageTitle+" (blue)] create");

