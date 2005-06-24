% Load the image
f = imread('rose.jpg') 

% Show it in a different window
figure, imshow(f) 

% Show the image inverted
figure, imshow(f(end:-1:1,end:-1:1)) 

% Show only one of every two pixels (sampled)
figure, imshow(f(1:2:end,1:2:end)) 

% Show the variation of the intensity for row 512
v = f(512,1:1:end) 
plot(v)

% Load a new image
g = imread('xrays.jpg') 
figure, imshow(g) 
 
% Expand its dynamic range
imshow(g,[]) 

% Save as JPEG with a quality factor of 30
imwrite(g, 'xrays2.jpg', 'quality', 30) 
h = imread('xrays2.jpg') 
figure, imshow(h) 

% See detailed information of the previous file
imfinfo xrays2.jpg 

% Use it as a MATLAB structure
K = imfinfo( 'xrays.jpg') 
K.Width
K.Height

% Compare the compression ratio of the previous image with its original
k1 = imfinfo('xrays.jpg') 
k2 = imfinfo('xrays2.jpg') 

ratio = 6261/15800 
ratio  = 

   0.3963 

% Creating a uint8 representation of an image (i. e., values from 0 to 255)
matrix = [0.2 0.5; 0.75 1 ] 
matrix2 = im2uint8(matrix)

matrix2  = 

  51  128 
 191  255 

% Creating a double representation of an image (i. e., values from 0 to 1)
h = uint8([25 50;128 200]) 
matrix3 = im2double(h) 

matrix3  = 

   0.0980    0.1961 
   0.5020    0.7843 

% Convert to b/w, where every pixel < 3 is black (0) and > =  3 is white (1)
f = [1 2;3 4] 

f  = 

    1     2 
    3     4 

h = im2bw(mat2gray(f), 0.6)
