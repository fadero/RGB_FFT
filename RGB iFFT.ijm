//return current image to "image" variable
image = getImageID();
originalimage = getTitle();
originalimage = substring(originalimage,10);

//check if image is RGB. if not, exit.
if (bitDepth() != 24) {
	exit ("Error: RGB Color image required."); 
}

//check if individual R/G/B FFTs still exist. If not, exit.
if (isOpen("FFT of" + originalimage + " (red)") == 0) {
	exit ("Error: Please keep the original Red FFT image open.");
}
if (isOpen("FFT of" + originalimage + " (green)") == 0) {
	exit ("Error: Please keep the original Green FFT image open.");
}
if (isOpen("FFT of" + originalimage + " (blue)") == 0) {
	exit ("Error: Please keep the original Blue FFT image open.");
}

//integrate any user changes to the RGB FFT into the R/G/B FFTs
run("Duplicate...", " ");

duplicateFFT = getTitle();
//duplicateFFT = substring(duplicateFFT,0,lengthOf(duplicateFFT)-7);

//split RGB channels of duplicate image (which doesn't contain frequency domain)
run("Split Channels");

//subtract any changes from the original red FFT image
image1 = "FFT of" + originalimage + " (red)";
image2 = duplicateFFT + " (red)";
imageCalculator("Subtract create", image1, image2);
temptitle = getTitle();
close(image2);

image1 = "FFT of" + originalimage + " (red)";
image2 = temptitle;
imageCalculator("Subtract",image1, image2);


//subtract any changes from the original green FFT image
image1 = "FFT of" + originalimage + " (green)";
image2 = duplicateFFT + " (green)";
imageCalculator("Subtract create", image1, image2);
temptitle = getTitle();
close(image2);

image1 = "FFT of" + originalimage + " (green)";
image2 = temptitle;
imageCalculator("Subtract",image1, image2);


//subtract any changes from the original blue FFT image
image1 = "FFT of" + originalimage + " (blue)";
image2 = duplicateFFT + " (blue)";
imageCalculator("Subtract create", image1, image2);
temptitle = getTitle();
close(image2);

image1 = "FFT of" + originalimage + " (blue)";
image2 = temptitle;
imageCalculator("Subtract",image1, image2);


//close unnecessary windows
selectWindow("Result of FFT of" + originalimage + " (red)");
close();
selectWindow("Result of FFT of" + originalimage + " (green)");
close();
selectWindow("Result of FFT of" + originalimage + " (blue)");
close();

//iFFT the modified R, G, and B FFTs
selectWindow("FFT of" + originalimage + " (red)");
run("Inverse FFT");
selectWindow("FFT of" + originalimage + " (red)");
close();

selectWindow("FFT of" + originalimage + " (green)");
run("Inverse FFT");
selectWindow("FFT of" + originalimage + " (green)");
close();

selectWindow("FFT of" + originalimage + " (blue)");
run("Inverse FFT");
selectWindow("FFT of" + originalimage + " (blue)");
close();

//merge original modified R, G, B FFTs
run("Merge Channels...", "c1=[Inverse FFT of" + originalimage + " (red)] c2=[Inverse FFT of" + originalimage + " (green)] c3=[Inverse FFT of" + originalimage + " (blue)]");

rename('RGB iFFT of RGB FFT of' + originalimage);
