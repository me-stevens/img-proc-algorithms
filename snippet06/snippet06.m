% Load image
f = imread('text.jpg');

% Threshold
T = graythresh(f);
T = T *255;
g1 = f <= T;
imshow(g1);

g2 = f >= T;
figure, imshow(g2);

% Load image
f = imread('xray1.jpg');

% Histograma
h = imhist(f);
figure, plot(h);

% Region grow
[i, NR, SI, TI] = regiongrow(f, 255, 65);
figure, imshow(g);
NR = 10
figure, imshow(SI);
figure, imshow(TI);

% Load image
f = imread('xray2.jpg');

% Split & Merge
j1 = splitmerge(f, 32, 'predicate');
figure, imshow(j1);

j2 = splitmerge(f, 16, 'predicate');
figure, imshow(j2);

j3 = splitmerge(f,  8, 'predicate');
figure, imshow(j3);

j4 = splitmerge(f,  4, 'predicate');
figure, imshow(j4);

j5 = splitmerge(f,  2, 'predicate');
figure, imshow(j5);

% Load image
f = imread('circles.jpg');

% B&W conversion
k = im2bw(f, graythresh(f));
figure, imshow(f);
figure, imshow(k);

% Distance calculation
kc = ~k;
figure, imshow(kc);

kd = bwdist(kc);
figure, imshow(kd,[]);

% Watershed
kl = watershed(kd);
figure, imshow(kl);
figure, imshow(kl, []);

klog = k & kl;   
figure, imshow(klog);

% Load image
f = imread('image.jpg');

% Filtering
mh = fspecial('sobel')
mh =
     1     2     1
     0     0     0
    -1    -2    -1

fd = double(f);
m  = sqrt(imfilter(fd, mh, 'replicate').^2 + imfilter(fd, mh','replicate').^2);
figure, imshow(imfilter(fd, mh, 'replicate'));
figure, imshow(imfilter(fd, mh','replicate'));
figure, imshow(m);

ml = watershed(m);
figure, imshow(ml);

wr = ml == 0;
mn = f;
mn(wr) = 255;
figure, imshow(mn);
