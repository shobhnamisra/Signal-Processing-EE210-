
%read image
I = imread('random.jpg');

h = ones(3,3)/9; %filter kernel
h1 = [ 0 -1 0 ; -1 4 -1 ; 0 -1 0]/4;

I1 = filter_3(I, h); %calling the filter function

figure
imshow(I1/255)


%use 



