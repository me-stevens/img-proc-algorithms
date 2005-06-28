% Load image
f = imread('hurricane.jpg');
w = imread('hurricane-mask.jpg');
figure, imshow(f);
figure, imshow(w);

% Correlation
g  = dftcorr(f,w);  
gs = gscale(g);
figure, imshow(gs);
figure, imshow(gs > 254);

% Load image
f = imread('bottle1.jpg');
g = imread('bottle2.jpg');
figure, imshow(f),
figure, imshow(g);

% Borders by polygons
[x1, y1] = minperpoly(f, 8);
[M,N] = size(f);
h1 = connectpoly(x1, y1);
H1 = bound2im(h1, M, N);
figure, imshow(H1);

[x2, y2] = minperpoly(g, 8);
[M,N] = size(g);
h2 = connectpoly(x2, y2);
H2 = bound2im(h2, M, N);
figure, imshow(H2);

% Noise
[x1r, y1r] = randvertex(x1, y1, 8);
[x2r, y2r] = randvertex(x2, y2, 8);

i1 = connectpoly(x1r, y1r);
I1 = bound2im(i1, M, N);
figure, imshow(I1);

i2 = connectpoly(x2r, y2r);
I2 = bound2im(i2, M, N);
figure, imshow(I2);

% Create chain
angles1 = polyangles(x1,y1);
s1 = floor(angles1/45)+1;
s1 = int2str(s1)

angles2 = polyangles(x2,y2);
s2 = floor(angles2/45)+1;
s2 = int2str(s2)

angles1r = polyangles(x1r,y1r);
s1r = floor(angles1r/45)+1;
s1r = int2str(s1r)

angles2r = polyangles(x2r,y2r);
s2r = floor(angles2r/45)+1;
s2r = int2str(s2r)

% Similarity of chains
a = strsimilarity(s1, s2);
b = strsimilarity(s1, s1r);
c = strsimilarity(s1, s2r);

d = strsimilarity(s2, s1r);
e = strsimilarity(s2, s2r);

h = strsimilarity(s1r, s2r);
