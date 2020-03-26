% Compute
data = [randn(100,2) * 0.4 - ones(100,2) ; randn(100,2) * 0.75 + ones(100,2)];
[dataIdx, center] = kmeans(data, 2);

% Plot
figure(1);
plot(data(:,1), data(:,2), '.'); 
title("Random Data");

figure(2);
plot(data(dataIdx == 1, 1), data(dataIdx == 1, 2), 'bo');   hold on;
plot(data(dataIdx == 2, 1), data(dataIdx == 2, 2), 'ro');   hold on;
plot(center(1,1), center(1,2), 'bx','LineWidth',2);
plot(center(2,1), center(2,2), 'rx','LineWidth',2);
title("After K-means Algorithm");