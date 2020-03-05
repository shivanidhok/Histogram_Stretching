clc;clear;close all;
% Shivani Dhok
% Date: January 31, 2020
% Digital Image Processing
% Program for: Histogram Stretching.

Smin = 20;
Smax = 255;

I = imread('lena2.png');
I_gray = rgb2gray(I);

[row col] = size(I_gray);                       % Size of gray image
len = row * col;                                % Total number of pixels
I_vec = I_gray(:);                              % Vectorinzing the matrix
I_sort = sort(I_vec);                           % Sorting the values in ascending values
I_unq = unique(I_sort);                         % Finding unique values

Imin = min(I_unq);
Imax = max(I_unq);

% Slope
Slope = (Smax-Smin)./(Imax-Imin);
S_new = Slope.*(I_unq-Imin)+Smin;

% Stretching
I_stretched = zeros(row,col);
for jj = 1:length(I_unq)
    I_stretched(I_gray == I_unq(jj)) = S_new(jj);
end

I_stretched = uint8(I_stretched);
figure;
subplot(2,2,1)
imshow(I_gray)
title('Original')
subplot(2,2,2)
imshow(I_stretched)
title('Stretched')
subplot(2,2,3)
histogram(I_gray)
subplot(2,2,4)
histogram(I_stretched)



