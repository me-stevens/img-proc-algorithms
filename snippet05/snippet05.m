% Load ('pattern.jpg');
figure, imshow(f);
 
  
% Point detection
w  = [-1 -1 -1; -1 8 -1; -1 -1 -1]
g1 = abs(imfilter(double(f), w));
figure, imshow(g1);

T  = max(g1(:))
g2 = g1 >= T;
figure, imshow(g2);
 
% Load image
f = imread('circuitMask.jpg');
figure, imshow(f);
 
% Line detection
w  = [2 -1 -1; -1 2 -1; -1 -1 2]
h1 = imfilter(double(f), w);
figure, imshow(h1, []);

h1 = abs(h1);
figure, imshow(h1);

T  = max(h1(:))
h2 = h1 >= T;
figure, imshow(h2, []);
figure, imshow (f);
 
% Load image
f = imread('house.jpg');
figure, imshow(f);
 
% Axis calculation with Sobel
[iv, t] = edge(f, 'sobel', 'vertical');
figure, imshow(iv);

[ih, t] = edge(f, 'sobel', 'horizontal');
figure, imshow(ih);

[ivh, t] = edge(f, 'sobel', 'both');
figure, imshow(ivh);
 
% Axis calculation with LoG
[j, t] = edge(f, 'roberts', 0.05);
figure, imshow(j, []);

[j, t] = edge(f, 'roberts', 0.10);
figure, imshow(j, []);

[j, t] = edge(f, 'roberts', 0.15);
figure, imshow(j,[]);
 
% Axis calculation with Canny
T = max(f(:)); 
k = imhist(f);
plot(k);

T = [0.15 0.35]
[l, t] = edge(f, 'canny', T, 0.1);
 
% Axis calculation with Sobel and a limit
t = 0.05;
[m, t] = edge(f, 'sobel');
figure, imshow(m);
 
% LoG with a limit and sigma 
t = 0.003;
sigma = 2.25;
[n, t] = edge(f, 'roberts', sigma);
figure, imshow(n);

[n, t] = edge(f, 'log', sigma);
figure, imshow(n, []);

% Canny with a limit and sigma
T = [0.04 0.10];
sigma = 1.5;
[n_canny, t] = edge(f, 'canny', T, sigma);
figure, imshow(n_canny,[]);
 
% Zero matrix
z = zeros(101,101);
z(  1,   1) = 1;
z(101,   1) = 1; 
z(  1, 101) = 1; 
z(101, 101) = 1; 
z( 51,  51) = 1;
figure, imshow(z);
 
% Hough transform
[o1, theta, rho] = hough(z, 0.1, 2);
figure, imshow(o1);

[o2, theta, rho] = hough(z);
figure, imshow(o2);
 
% Hough transform - plot
[p, theta, rho] = hough(z);
figure, imshow(theta, rho, p, [], 'notruesize');
axis on;
axis normal;
xlabel('\theta')
ylabel('\rho')

% Hough transform of Canny with limit
[q, theta, rho] = hough(g_canny, 0.5, 2);
figure, imshow(theta, rho, q, [], 'notruesize');
axis on;
axis normal;
xlabel('\theta')
ylabel('\rho')
 
% Hough peaks
[r, c] = houghpeaks(q,5);
hold on
plot(theta(c), rho(r), 'linestyle', 'none', 'marker', 's', 'color', 'w');
 
% Hough lines
lines = houghlines(g_canny, theta, rho, r, c);
figure, imshow(g_canny), hold on

for k = 1:length(lines)
	xy = [lines(k).point1;
	lines(k).point2];
	plot(xy(:,2), xy(:,1), 'LineWidth', 4, 'Color', [.6 .6 .6]);
end

