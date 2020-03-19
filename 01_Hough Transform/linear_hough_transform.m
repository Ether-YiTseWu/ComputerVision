imgRGB = imread("road.jpg");
imgGray = rgb2gray(imgRGB);

imgEdge_bad = edge(imgGray, 'canny');
imgBlur = imgaussfilt(imgGray, 10);
imgEdge = edge(imgBlur, 'canny');
[H, T, R] = hough(imgEdge, 'RhoResolution', 0.5, 'ThetaResolution', 0.5);
peakValue = houghpeaks(H, 10);
lines = houghlines(imgEdge, T, R, peakValue,'FillGap',1000,'MinLength',3)

figure(1);
subplot(1,5,1); imshow(imgRGB);  title("RGB Image");
subplot(1,5,2); imshow(imgGray); title("Gray Image");
subplot(1,5,3); imshow(imgBlur); title("Blur Image");
subplot(1,5,4); imshow(imgEdge); title("Edge Image");
subplot(1,5,5); imshow(imgEdge_bad); title("Bad Edge Image");

figure(2);
imshow(imadjust(mat2gray(H))); title("Image After Hough Transform"); 
axis on, axis normal, hold on;

figure(3);
imshow(imgRGB); hold on; title("Detect Result");
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1),xy(:,2),'LineWidth',3,'Color','green');   
end
