# Coin-Identification

The goal of the Coin Identification Project is to implement a system that can estimate the number of various coins in the image

Sample: Input Image:
![1](https://user-images.githubusercontent.com/48822463/194524905-21f24111-21b8-46e2-bdce-0b486fa4beeb.JPG)

## Steps:


1. Calibration
2. Preprocessing
3. Geometric radius estimation
4. Color estimation
5. Model performance
6. Other approaches (k-means clustering)
7. Other approaches (normxcorr, Fourier transform)

**The detailed approach, steps and results can be found in Coin-Identification Solution and Approach.pdf**

## Run the project
You can run the program **test.m**
test.m runs for all the 12 input images named : 1.jpg, 2.jpg, etc.

In test.m  the main function is:  estim_coins which is called as

[coins] = estim_coins(measurement, bias, dark, flat);

where the output coins contains the number of various coins found from the measurement image measurement. 
The other inputs are bias, dark, flat images which contain the bias, dark, and flat images, respectively. The output coins is a six-element vector with the first element corresponding to the number of 5 cent-coins in the image and the last element corresponding to the number of 2 euro-coins in the image. The image measurement is one image only, the same applies to the images bias, dark and flat, they are the mean images B,ˆ D,ˆ Fˆ for the intensity calibration for as the image measurement R as

R = R - Bˆ - Dˆ / Fˆ

where Fˆ needs to be scaled such that the Fˆ =1. In may cases Fˆ consists of one image F only, it is the flat field in the measurement and as such Fˆ= F.
Inside the function estim_coins you should define two calibrations, first the calibration of the intensity and then also the geometric calibration for the input image. Typically the output from the geometric calibration is a two-element vector containing the 2D-mapping from millimeters to pixels (the first element is corresponding.


**The Model Perdformace was on average 84%**
