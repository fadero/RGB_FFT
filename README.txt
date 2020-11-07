READ ME

RGB FFT
This macro takes a single RGB image, splits the component channels, and individually performs an FFT on each channel. Then it merges the FFT'd channels and assigns them with their appropriate pseudocolor to display a single RGB fourier image.

RGB FFT also keeps the single-channel FFT windows open. This is very important if you want to later perform an inverse FFT, since the FFT command does not save the frequency domain data in the image itself (rather, it performs an invisible FHT and keeps that in Fiji's memory). 

If you want to modify the RGB FFT image for later iFFT, do not do so on the individual channels- do so on the merged image.

RGB iFFT
This macro requires an RGB FFT image and the original, individual FFT images. The macro is run on a single RGB FFT image but looks for appropriately named FFT channels (presumably, from the RGB FFT macro). 

The macro splits the (optionally modified) RGB FFT image into its component channels and compares them to the original FFT images. It integrates any manual changes to the channels into the original FFT images, then individually performs an inverse FFT on each image. Finally, it recombines the real-space, single-channel images into an RGB real-space image and closes all unnecessary windows.

Consider using the provided CD_diffraction.jpeg file to test out the macro!