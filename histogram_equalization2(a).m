clc;
clear; 
close all;

I = imread('wk_eg.jpg'); % read grayscale image
figure, imshow(I), title('Original Image');

% histogram equalization
I_heq = histeq(I);

% Display the result
figure, % Opens new window for figure 2 
imshow(I_heq), title('Histogram Equalized Image');

% Histograms
figure;
subplot(1,2,1), imhist(I), title('Original Histogram'); 
subplot(1,2,2), imhist(I_heq), title('Equalized Histogram');
