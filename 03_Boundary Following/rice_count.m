% Read Img
img = imread('rice.png');

% Use Open and Close to find img background
struct = strel('square',30);
imO = imopen(img, struct);
imOC = imclose(imO, struct);
imgBetter = img - imOC;

% Find boundaries (Bad)
imgThreshHold = graythresh(img);
BW = imbinarize(img,imgThreshHold);
[B, L] = bwboundaries(BW, 'noholes');

% Find boundaries (Better)
imgThreshHold_better = graythresh(imgBetter);
BW_better = imbinarize(imgBetter,imgThreshHold_better);
[B_better, L_better] = bwboundaries(BW_better, 'noholes');

% Plot
figure(1);
subplot(2,2,1); imshow(img);  title("Original Image", 'fontsize',14);
subplot(2,2,2); imshow(imOC); title("Background", 'fontsize',14);
subplot(2,2,3); imshow(BW);   title("Bad Binarization", 'fontsize',14);
subplot(2,2,4); imshow(BW_better); title("Better Binarization", 'fontsize',14);

figure(2);
subplot(1,2,1); imshow(BW); hold on; title("Bad Boundaries", 'fontsize',14); 
for i = 1 : length(B)
    al = B{i};
    plot(al(:, 2), al(:, 1), 'r');
end
subplot(1,2,2); imshow(BW_better); hold on; title("Better Boundaries", 'fontsize',14);
for i = 1 : length(B_better)
    al = B_better{i};
    plot(al(:, 2), al(:, 1), 'r');
end