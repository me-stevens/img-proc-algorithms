% Load image
f = imread('circle.jpg');
imshow(f);

% Average filter and extend borders with replicate
w = fspecial('average')
g = imfilter(f, w, 'replicate');
imshow(g);

% Cell Array
h1 = im2bw(g, 0.5);
figure, imshow(h1);
B = boundaries(h1)
B = 

    [   3x2 double]
    [  36x2 double]
    [  47x2 double]
    [  31x2 double]
    [  13x2 double]
    [   4x2 double]
    [   9x2 double]
    [  23x2 double]
    [   5x2 double]
    [   3x2 double]
    [  24x2 double]
    [   5x2 double]
    [  14x2 double]
    [1376x2 double]
    [   7x2 double]
    [   9x2 double]
	... etc

B{2}
ans =

   288    10
   287    11
   286    11
   285    11
   284    11
   283    11
   282    12
   281    12
   280    12
   279    12
   278    13
   277    13
   276    13
   277    13
   278    13
   279    13
   280    13
   281    12
   282    12
   283    12
   284    12
   285    11
   286    11
   287    11
   288    11
   289    11
   290    10
   291    10
   290    10
   289    10
   288    10

% Cell fun
d = cellfun('length', B)
[max_d, k] = max(d)
b = B{k};

[M N] = size(g);
h2 = bound2im(b, M, N, min(b(:,1)), min(b(:,2)));
figure, imshow(h2);

% Outline reduction
[s, su] = bsubsamp(b, 50);
i1 = bound2im(s, M, N, min(s(:,1)), min(s(:,2)));
figure, imshow(i1);

cn = connectpoly(s(:,1), s(:,2));
i2 = bound2im(cn, M, N, min(cn(:,1)), min(cn(:,2)));
figure, imshow(i2);

% Chain code
c = fchcode(su);
c.fcc
c.diff
c.mm
c.diffmm
c.x0y0

% Load image
f = imread('leaf.jpg');
figure, imshow(f);

% Boundaries
j1 = im2bw(f, 0.5);
figure, imshow(j1);

b = boundaries(j1, 4, 'cw');
d = cellfun('length', b)
[max_d, k] = max(d)
b = b{k};
[M N] = size(j1);
j2 = bound2im(b, M, N, min(b(:,1)), min(b(:,2)));
figure, imshow(j2);

% Polygon representation
[x, y] = minperpoly(f, 2);
b2  = connectpoly(x,y);
kB1 = bound2im(b2, M, N, min(x), min(y));
figure, imshow(kB1);

[x, y] = minperpoly(f, 3);
b2  = connectpoly(x,y);
kB2 = bound2im(b2, M, N, min(x), min(y));
figure, imshow(kB2);

[x, y] = minperpoly(f, 4);
b2  = connectpoly(x,y);
kB3 = bound2im(b2, M, N, min(x), min(y));
figure, imshow(kB3);

[x, y] = minperpoly(f, 8);
b2  = connectpoly(x,y);
kB4 = bound2im(b2, M, N, min(x), min(y));
figure, imshow(kB4);

% Load image
f = imread('border1.jpg');
figure, imshow(f);

l1 = im2bw(f, 0.5);
figure, imshow(l1);

B = boundaries(l1)
d = cellfun('length', B)
[max_d, k] = max(d)
b = B{k};
[M N] = size(l1);
l2 = bound2im(b, M, N, min(b(:,1)), min(b(:,2)));
figure, imshow(l2);

% Signature
[st, angle, x0, y0] = signature(b);
x0
y0
figure, plot(angle, st);
xlabel('Angle');
ylabel('Signature');
title('SIGNATURE CALCULATION');

% Load image
f = imread('border2.jpg');
figure, imshow(f);

n1 = im2bw(f, 0.5);
figure, imshow(n1);

B = boundaries(n1)
d = cellfun('length', B)
[max_d, k] = max(d)
b = B{k};
[M N] = size(n1);
n2 = bound2im(b, M, N, min(b(:,1)), min(b(:,2)));
figure, imshow(n2);

[st, angle, x0, y0] = signature(b);
x0
y0
figure, plot(angle, st);
xlabel('Angle');
ylabel('Signature');
title('SIGNATURE CALCULATION');

% Load image
f = imread ('chromosome.jpg');
figure, imshow(f);

% Gaussian filter
f = im2double(f);
h = fspecial('gaussian', 15, 9);
o1 = imfilter(f, h, 'replicate');
figure, imshow(o1);

o2 = im2bw(o1, 0.7);
figure, imshow(o2);

% More gaussians
p1 = im2bw(o1, 0.5);
figure, imshow(p1);

B = boundaries(p1)
d = cellfun('length', B)
[max_d, k] = max(d)
b = B{k};
[M N] = size(o1);
p2 = bound2im(b, M, N, min(b(:,1)), min(b(:,2)));
figure, imshow(p2);

% Fourier decomposition of the outline
z  = frdescp(b);
bn = ifrdescp(z, 546);
q1 = bound2im(bn, 344, 270);
figure, imshow(q1);

% Repeat
bn = ifrdescp(z, 110);
q2 = bound2im(bn, 344, 270);
figure, imshow(q2);

bn = ifrdescp(z, 56);
q3 = bound2im(bn, 344, 270);
figure, imshow(q3);

bn = ifrdescp(z, 28);
q4 = bound2im(bn, 344, 270);
figure, imshow(q4);

bn = ifrdescp(z, 14);
q5 = bound2im(bn, 344, 270);
figure, imshow(q5);

bn = ifrdescp(z, 8);
q6 = bound2im(bn, 344, 270);
figure, imshow(q6);

