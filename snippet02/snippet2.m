% Load the image
f = imread('mammography.jpg');
imshow(f)

g1 = imadjust(f, [0 1], [1 0]);
imshow(g1)

% Dynamic range
g2 = imadjust(f, [0.5 0.75], [0 1]);
figure, imshow(g2);

g3 = imadjust(f, [0 1], [0 1], 2);
figure, imshow(g3);

% Load next image
f = imread('fourier.jpg');
imshow(f)

% Logaritmic transformation
g = 1 * log(1 + double(f));
imshow(g)

gs = im2uint8(mat2gray(g));
figure, imshow(g)
figure, imshow(gs)
figure, imshow(f)

% Load next image
f = imread('bones.jpg');
imshow(f)

% Mean and contrast-streching
m = mean2(f)

m =

   17.1349

g4 = 1 ./ (1 + (m ./ (double(f) + eps)).^0.7);
g5 = 1 ./ (1 + (m ./ (double(f) + eps)).^1.5); 
imshow(g4);
imshow(g5);

% Yet another image
f = imread('rose.jpg');
imshow(f)

% Histogram
h = imhist(f);
plot(h)

axis([0 260 0 7.5]);
plot(h)

set(gca, 'xtick', 0:50:250);
xlabel('Pixel value', 'fontsize', 10);
ylabel('Frecuencies', 'fontsize', 10);
title('Histogram of rose.jpg');

% Load pollen image
f = imread('pollen.jpg');
imshow(f)

% Equalization
h = imhist(f);
plot(h)
figure, imshow(f)

g = histeq(f,500);
figure, plot(g)
figure, imshow(g)

% Load moon image
f = imread('moon.jpg');
imshow (f)

% Equalization
h = histeq(f,256);
figure, imshow(h)

g = imhist(f);
plot (g)

g2 = imhist(h);
figure, plot(g2);

% Local adaptation of the histogram with a gaussian
C1 = 1.5  * (1 / ((2*pi)^0.5)*0.05);
C2 = 0.15 * (1 / ((2*pi)^0.5)*0.05);

k1 = 2 * (0.05 ^2);
k2 = 2 * (0.05 ^2);

z = linspace(0,1,256);
p = 1 + C1 * exp(-((z-0.1).^2) ./ k1) + C2 * exp(-((z-0.65).^2)./k2);
figure, plot(p);

C1 = 0.8  * (1 / ((2*pi)^0.5)*0.05);
C2 = 0.09 * (1 / ((2*pi)^0.5)*0.05);

k1 = 2 * (0.05 ^2);
k2 = 2 * (0.05 ^2);

z = linspace(0,1,256);
p = 0.00198 + C1 * exp(-((z-0.15).^2) ./ k1) + C2 * exp(-((z-0.72).^2)./k2);
figure, plot(p);

axis([0 300 0 0.02]);
figure, plot(p);
