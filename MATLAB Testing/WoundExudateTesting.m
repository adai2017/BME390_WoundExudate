nScopeAPI('open',1);
n = 20;         % Number of minutes want to run
%interval = 1;   % How long between intervals in minutes
fs = 5;         % Sampling Rate
DataSet1 = zeros(60,fs,n);
MeanSet1 = zeros(60,1,n);

i = 1;

for i = 1:1:n
    fprintf('Starting Minute %d Testing...\n', i)
    TempDataSet = nScopeReadCh1(fs, fs*60, 1);
    TempDataSet = reshape(TempDataSet, [fs, 60]);
    TempDataSet = TempDataSet';
    DataSet1(:,:,i) = TempDataSet(:,:);
    MeanSet1(:,:,i) = mean(DataSet1(:,:,i),2);

    if i > 2
        if any(MeanSet1(:,:,i) > MeanSet1(:,:,i - 1))
            fprintf('STRIKETHROUGH: MINUTE %d\n', i);
        end
    end
    fprintf('Completed Minute %d Testing.\n', i)
    save('WoundExudateTesting_Case_030217_1_2.mat')  % Resaves collected data after every iteration
end

nScopeAPI('close');