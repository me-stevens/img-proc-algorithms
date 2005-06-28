% Load image
f = imread('flower.jpg');
imshow(f);

% Change the representation to indexed
[X, map] = rgb2ind(f, 8, 'dither');
figure, imshow(X, map);

[X, map] = rgb2ind(f, 8, 'nodither');
figure, imshow(X, map);

% Average filter
w = fspecial('average', [25 25]);
g = imfilter(f, w, 'corr', 'replicate', 'full');
h = imfilter(f, w, 'corr', 'replicate', 'same');
figure, imshow(g);
figure, imshow(h);

% Border highlight
lapmask = [1 1 1; 1 -8 1; 1 1 1];
fen = imfilter(f, lapmask, 'replicate');
figure, imshow(f-fen);

% Load image
i = imread('fourcolors.jpg');

% Color gradient image
[VG, A, PPG] = colorgrad(f);
figure, imshow(VG);
figure, imshow(A);
figure, imshow(PPG);

[VG, A, PPG] = colorgrad(i);
figure, imshow(VG);
figure, imshow(A);
figure, imshow(PPG);
