clc; 
clear; 
close all;

% Read grayscale image
I = imread('lena.jpg');
figure, imshow(I), title('Original Image');

% Convert to 8-bit if not already
I = im2uint8(I);

% Extract and display all 8 bit-planes
figure;
for k = 1:8
    bit_plane = bitget(I, k); % Get k-th bit plane
    subplot(2,4,k);
    imshow(uint8(bit_plane) * 255); 
    title(['Bit Plane ', num2str(k)]);
end
