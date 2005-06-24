% Load image
f = imread('squares.jpg');
imshow(f);

% Average filter
avgF = fspecial('average', 31);
g1   = imfilter(f, Fmedia, 'corr', 'replicate', 'same');
g2   = imfilter(f, Fmedia, 'corr', 'symmetric', 'same');
g3   = imfilter(f, Fmedia, 'corr', 'circular',  'same');
imshow(g1);
figure, imshow(g2);
figure, imshow(g3);

% Load image
h = imread('moon.jpg');
imshow(h);

%Laplacian filter
lapF = fspecial('laplacian', 0);
lapF =

     0     1     0
     1    -4     1
     0     1     0
plot(lapF);
imshow (lapF);
 
h1 = imfilter(h, lapF, 'corr', 'replicate', 'same');
h2 = imfilter(h, lapF, 'corr', 'symmetric', 'same');
h3 = imfilter(h, lapF, 'corr', 'circular',  'same');
imshow(h1);
figure, imshow(h2);
figure, imshow(h3);
figure, imshow(h1,[]);
figure, imshow(h2,[]);
figure, imshow(h3,[]);

% Conversion to double
h = im2double(h);
imshow(h);

h1d = imfilter(h, lapF, 'corr', 'replicate', 'same');
h2d = imfilter(h, lapF, 'corr', 'symmetric', 'same');
h3d = imfilter(h, lapF, 'corr', 'circular',  'same');
imshow(h1d,[]);
figure, imshow(h2d,[]);
figure, imshow(h3d,[]);

% Substracting matrices
hh1d = h - h1d;
hh2d = h - h2d;
hh3d = h - h3d;
imshow(hh1d,[]);
figure, imshow(hh2d,[]);
figure, imshow(hh3d,[]);
figure, imshow(h,[]);


% Load image
i = imread ('circuit.jpg');
imshow(i);

% Salt & Pepper
in = imnoise(i, 'salt & pepper', 0.2);
imshow(in);

% Fixing image
medianF = fspecial('average');
medianF =

    0.1111    0.1111    0.1111
    0.1111    0.1111    0.1111
    0.1111    0.1111    0.1111

in1 = imfilter(in, medianF, 'corr', 'replicate', 'same');
in2 = imfilter(in, medianF, 'corr', 'symmetric', 'same');
in3 = imfilter(in, medianF, 'corr', 'circular',  'same');
imshow(in1, []); 
figure, imshow(in2, []); 
figure, imshow(in3, []);
figure, imshow(in,[]);

% Median filter
zeros1 = medfilt2(in);
imshow(zeros1);
figure, imshow(in);
figure, imshow('circuit.jpg');

% Symmetric
zeros2 = medfilt2(in, 'symmetric');
imshow(in);
figure, imshow(zeros1);
figure, imshow(zeros2);
figure, imshow('circuit.jpg');

% Loading image
j = imread('audi.jpg');
imshow(j);

% Border detection
h1 = [ 1  1 1;  0 0 0; -1 -1 -1]
h2 = [-1  0 1; -1 0 1; -1  0  1]
h3 = [ 0  1 1; -1 0 1; -1 -1  0]
h4 = [-1 -1 0; -1 0 1;  0  1  1]

h1 =

     1     1     1
     0     0     0
    -1    -1    -1

h2 =

    -1     0     1
    -1     0     1
    -1     0     1

h3 =

     0     1     1
    -1     0     1
    -1    -1     0

h4 =

    -1    -1     0
    -1     0     1
     0     1     1
    
a1  = imfilter(j, h1, 'corr', 'same');
a2  = imfilter(j, h2, 'corr', 'same');
a3  = imfilter(j, h3, 'corr', 'same');
a4  = imfilter(j, h4, 'corr', 'same');
ans = max(a1, a2);
ens = max(a3, a4);
prewitt = max(ans, ens);
imshow(prewitt)

% Sobel
h1 = [ 1  2 1;  0 0 0; -1 -2 -1]
h2 = [-1  0 1; -2 0 2; -1  0  1]
h3 = [ 0  1 2; -1 0 1; -2 -1  0]
h4 = [-2 -1 0; -1 0 1;  0  1  2]

h1 =

     1     2     1
     0     0     0
    -1    -2    -1


h2 =

    -1     0     1
    -2     0     2
    -1     0     1


h3 =

     0     1     2
    -1     0     1
    -2    -1     0


h4 =

    -2    -1     0
    -1     0     1
     0     1     2

b1 = imfilter(j, h1, 'corr', 'same');
b2 = imfilter(j, h2, 'corr', 'same');
b3 = imfilter(j, h3, 'corr', 'same');
b4 = imfilter(j, h4, 'corr', 'same');
ans = max(b1, b2);
ens = max(b3, b4);
sobel = max(ans, ens);
imshow(sobel);
figure, imshow(prewitt);

% Robinson
h1  = [ 1  1 1;  1 -2 1; -1 -1 -1]
h2  = [-1  1 1; -1 -2 1; -1  1  1]
h3  = [ 1  1 1; -1 -2 1; -1 -1  1]
h4  = [-1 -1 1; -1 -2 1;  1  1  1]

c1  = imfilter(j, h1, 'corr', 'same');
c2  = imfilter(j, h2, 'corr', 'same');
c3  = imfilter(j, h3, 'corr', 'same');
c4  = imfilter(j, h4, 'corr', 'same');
ans = max(c1, c2);
ens = max(c3, c4);
robinson = max(ans, ens);
imshow(robinson);
figure, imshow(sobel);
figure, imshow(prewitt);

h1 =

     1     1     1
     1    -2     1
    -1    -1    -1

h2 =

    -1     1     1
    -1    -2     1
    -1     1     1

h3 =

     1     1     1
    -1    -2     1
    -1    -1     1

h4 =

    -1    -1     1
    -1    -2     1
     1     1     1

% kirsch
h1  = [ 3  3 3;  3 0 3; -5 -5 -5];
h2  = [-5  3 3; -5 0 3; -5  3  3];
h3  = [ 3  3 3; -5 0 3; -5 -5  3];
h4  = [-5 -5 3; -5 0 3;  3  3  3];

d1  = imfilter(j, h1, 'corr', 'same');
d2  = imfilter(j, h2, 'corr', 'same');
d3  = imfilter(j, h3, 'corr', 'same');
d4  = imfilter(j, h4, 'corr', 'same');
ans = max(d1, d2);
ens = max(d3, d4);
kirsch = max(ans, ens);
imshow(kirsch); figure, imshow(robinson);
figure, imshow(sobel);
figure, imshow(prewitt);
