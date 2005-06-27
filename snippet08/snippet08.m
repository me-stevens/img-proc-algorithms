% Load image
f = imread('chromosome.jpg');
figure, imshow(f);

% Filtering
f  = im2double(f);
h  = fspecial('gaussian', 15, 9);
g1 = imfilter(f, h, 'replicate');
figure, imshow(g1);

g2 = im2bw(g1, 0.7);
figure, imshow(g2);

% Property calculations
g2_B = bwlabel(g2);
figure, imshow(g2_B);
D = regionprops(g2_B, 'area', 'boundingbox', 'Centroid', 'EulerNumber')

% Load image
f = imread('stillLife.jpg');

g3 = f(1:2:end,1:2:end);
g3_fhsp = padarray(g3, [184 184], 'both');
figure, imshow(g3_fhsp);

% Mirroring
i1 = fliplr(f);
i1_fhsp = padarray(i1, [84 84], 'both');
figure, imshow(i1_fhsp);

% Rotate
i2 = imrotate(f, 45, 'bilinear');
figure, imshow(i2);

i3 = imrotate(f, 2, 'bilinear');
figure, imshow(i3);

i3_fhsp = padarray(i3, [76 76], 'both');
figure, imshow(i3_fhsp);

% Moments
moments = abs(log(invmoments(f)))

g    = f(1:2:end,1:2:end);
fhsp = padarray(g, [184 184], 'both');
moments = abs(log(invmoments(fhsp)))

fm   = fliplr(f);
fhsp = padarray(fm, [84 84], 'both');
moments = abs(log(invmoments(fhsp)))

g = imrotate(f, 45, 'bilinear');
moments = abs(log(invmoments(g)))

g    = imrotate(f, 2, 'bilinear');
fhsp = padarray(g, [76 76], 'both');
moments = abs(log(invmoments(fhsp)))

% Loading
f1 = imread('satellite1.jpg');
f2 = imread('satellite2.jpg');
f3 = imread('satellite3.jpg');
f4 = imread('satellite4.jpg');
f5 = imread('satellite5.jpg');
f6 = imread('satellite6.jpg');

% Multivector image structure
S = cat(3,f1,f2,f3,f4,f5,f6);
[X, R] = imstack2vectors(S);

% Main components
P  = princomp(X, 6);

j1 = P.Y(:,1);
j1 = reshape(j1, 512, 512);
figure, imshow(j1,[]);

j2 = P.Y(:,2);
j2 = reshape(j2, 512, 512);
figure, imshow(j2,[]);

j3 = P.Y(:,3);
j3 = reshape(j3, 512, 512);
figure, imshow(j3,[]);

j4 = P.Y(:,3);
j4 = reshape(j4, 512, 512);
figure, imshow(j4,[]);

j5 = P.Y(:,5);
j5 = reshape(j5, 512, 512);
figure, imshow(j5,[]);

j6 = P.Y(:,6);
j6 = reshape(j6, 512, 512);
figure, imshow(j6,[]);

d = diag(P.Cy)

% Repeat for a value of 2
Q = princomp(X, 2);

q1 = Q.Y(:,1);
q1 = reshape(q1, 512, 512);
figure, imshow(q1,[]);

q2 = Q.Y(:,2);
q2 = reshape(q2, 512, 512);
figure, imshow(q2,[]);

d = diag(Q.Cy)

% Reconstructed images
r1 = Q.X(:,1);
r1 = reshape(r1, 512, 512);
figure, imshow(r1,[]);

r2 = Q.X(:,2);
r2 = reshape(r2, 512, 512);
figure, imshow(r2,[]);

r3 = Q.X(:,3);
r3 = reshape(r3, 512, 512);
figure, imshow(r3,[]);

r4 = Q.X(:,4);
r4 = reshape(r4, 512, 512);
figure, imshow(r4,[]);

r5 = Q.X(:,5);
r5 = reshape(r5, 512, 512);
figure, imshow(r5,[]);

r6 = Q.X(:,6);
r6 = reshape(r6, 512, 512);
figure, imshow(r6,[]);

