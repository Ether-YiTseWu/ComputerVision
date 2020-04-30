clear; clc;

% Load filr
load fisheriris

% Separate features from fisheriris
idx = ~strcmp(species, 'setosa');
feature = meas(:, 3:4);

% Use svm function
classifier = fitcsvm(feature, idx);
supportVector = classifier.SupportVectors;

% Plot
figure(1); title("Iris Data")
for i = min(feature(:,1)):0.05:max(feature(:,1))+1
    for j = min(feature(:,2)):0.05:max(feature(:,2))+1
        [result, score] = predict(classifier, [i, j]);
        if result == 0
            plot(i, j, 'g*'); hold on;
        elseif result == 1
            plot(i, j, 'c*'); hold on;
        end
        if score <= 0.05
            plot(i, j, 'k*'); hold on;
        end
    end
end

for i = 1:size(feature, 1)
    if idx(i) == 0
        plot(feature(i,1), feature(i,2), 'ro'); hold on;
    else
        plot(feature(i,1), feature(i,2), 'bo'); hold on;
    end
end

sv = plot(supportVector(:,1),supportVector(:,2),'k+','MarkerSize',10);
legend(sv, "Support Vector");
