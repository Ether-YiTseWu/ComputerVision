% Read Img
imgGray = imread('coins.png');

% Get features
features = regionprops('table', imgGray, 'EquivDiameter', 'Centroid', 'EulerNumber', 'FilledArea', 'Solidity', 'ConvexArea', 'Extent');
offsets = [0 1];
[Gc, Is] = graycomatrix(imgGray,'Offset', offsets);

% Plot
subplot(2,3,1); imshow(imgGray);    title("Image", 'fontsize', 14);
subplot(2,3,2); plot(features.EquivDiameter); axis([0, 255, 0 ,max(features.EquivDiameter)]);    title("EquivDiameter", 'fontsize', 14);
subplot(2,3,3); plot(features.FilledArea);    axis([0, 255, 0 ,max(features.FilledArea)]);       title("FilledArea", 'fontsize', 14);
subplot(2,3,4); plot(features.EulerNumber);   axis([0, 255, 0 ,max(features.EulerNumber)]);      title("EulerNumber", 'fontsize', 14);
subplot(2,3,5); plot(features.ConvexArea);    axis([0, 255, 0 ,max(features.ConvexArea)]);       title("ConvexArea", 'fontsize', 14);
subplot(2,3,6); plot(features.Solidity);      axis([0, 255, 0 ,max(features.Solidity)]);         title("Solidity", 'fontsize', 14);
