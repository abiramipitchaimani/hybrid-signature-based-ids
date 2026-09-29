%% HYBRID INTRUSION DETECTION SYSTEM (IDS)

clc; clear; close all;

%% STEP 1: Generate or Load Simulated Dataset
N = 2000;  % total samples


normal = [randn(N/2,3)*15+50, randi([10 70],N/2,2)];
attack = [randn(N/2,3)*18+65, randi([40 100],N/2,2)];

% Combine data
X = [normal; attack];
Y = [zeros(N/2,1); ones(N/2,1)]; % 0=normal, 1=attack

% Convert to table for consistency
T = array2table([X Y], 'VariableNames', ...
    {'duration','src_bytes','dst_bytes','count','srv_count','label'});

%% STEP 2: Define Signature-Based Rules 
sigDB(1).rule = @(x) x(3) > 85;   % High dst_bytes
sigDB(2).rule = @(x) x(4) > 75;   % High count
sigDB(3).rule = @(x) x(1) > 75;   % Long duration

% Apply signature detection
N = size(X,1);
sigDetected = false(N,1);
for i = 1:N
    for k = 1:numel(sigDB)
        if sigDB(k).rule(X(i,:))
            sigDetected(i) = true;
            break;
        end
    end
end

disp('✅ Signature-based detection complete.');

%% STEP 3: Split Dataset into Train/Test
cv = cvpartition(Y, 'HoldOut', 0.3);
Xtrain = X(training(cv),:);
Ytrain = Y(training(cv));
Xtest = X(test(cv),:);
Ytest = Y(test(cv));
sigTest = sigDetected(test(cv));

%% STEP 4: Train Machine Learning Model (Random Forest)
disp('Training Random Forest model...');
RF = TreeBagger(40, Xtrain, Ytrain, 'Method', 'classification');  % fewer trees = more realistic
[~, scores] = predict(RF, Xtest);
MLprob = scores(:,2);
% Predict on training data
Ytrain_pred = predict(RF, Xtrain);
Ytrain_pred = str2double(Ytrain_pred);

% Training accuracy
train_accuracy = sum(Ytrain_pred == Ytrain) / length(Ytrain) * 100;

fprintf('Training Accuracy: %.2f%%\n', train_accuracy);
% Predict on testing data
Ytest_pred = predict(RF, Xtest);
Ytest_pred = str2double(Ytest_pred);

% Testing accuracy
test_accuracy = sum(Ytest_pred == Ytest) / length(Ytest) * 100;

fprintf('Testing Accuracy : %.2f%%\n', test_accuracy);


%% STEP 5: Combine Signature + ML (Hybrid IDS)
threshold = 0.55;  % Slightly stricter ML threshold
hybridPred = zeros(size(Ytest));

for i = 1:length(Ytest)
    if sigTest(i)
        hybridPred(i) = 1;
    elseif MLprob(i) >= threshold
        hybridPred(i) = 1;
    else
        hybridPred(i) = 0;
    end
end

%% STEP 6: Evaluate Performance
TP = sum((hybridPred==1) & (Ytest==1));
FP = sum((hybridPred==1) & (Ytest==0));
TN = sum((hybridPred==0) & (Ytest==0));
FN = sum((hybridPred==0) & (Ytest==1));

Accuracy = (TP+TN)/(TP+TN+FP+FN);
TPR = TP/(TP+FN);      % Detection rate
FPR = FP/(FP+TN);      % False positive rate
Precision = TP/(TP+FP);
F1 = 2*(Precision*TPR)/(Precision+TPR);

fprintf('\n=== HYBRID IDS PERFORMANCE ===\n');
fprintf('Accuracy: %.2f%%\n', Accuracy*100);
fprintf('Detection Rate (TPR): %.2f%%\n', TPR*100);
fprintf('False Positive Rate (FPR): %.2f%%\n', FPR*100);
fprintf('F1 Score: %.3f\n', F1);

%% STEP 7: Plot Results
[Xroc, Yroc, ~, AUC] = perfcurve(Ytest, MLprob, 1);

figure;
plot(Xroc, Yroc, 'b', 'LineWidth', 2);
xlabel('False Positive Rate');
ylabel('True Positive Rate');
title(['ROC Curve (AUC = ' num2str(AUC, '%.3f') ')']);
grid on;

figure;
bar([mean(sigTest)*100, mean(MLprob>=threshold)*100, mean(hybridPred)*100]);
set(gca, 'XTickLabel', {'Signature', 'ML', 'Hybrid'});
ylabel('Detection Rate (%)');
title('Comparison of Detection Methods');
grid on;