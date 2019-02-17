img = imread('cameraman.tif');

% ignore noise
blur_img = imgaussfilt(img);

% masks
gx = [-1/2, 0, 1/2; -1, 0, 1; -1/2, 0, 1/2];
gy = gx';

% convolute
% same means the size of the new image is the same; By adding zero paddings
% before calculating and deleting them afterwards
conv_img_x = conv2(blur_img, gx, 'same');
conv_img_y = conv2(blur_img, gy, 'same');

conv_img = abs(conv_img_x) + abs(conv_img_y);

% normalize
norm_img = normalize(conv_img);

% normalize
% imgX = imgX/max(imgX(:));
% imgY = imgY/max(imgY(:));

imshow(norm_img)