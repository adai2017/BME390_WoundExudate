nScopeAPI('open',1);
n = 20;         % Number of minutes want to run
fs = 5;         % Sampling Rate
DataSet1 = zeros(60,fs,n);       % Raw Data for Top IR Photosensor
DataSet2 = zeros(60,fs,n);       % Raw Data for Bottom IR Photosensor
DataSet3 = zeros(60,fs,n);       % Raw Data for Teensy IR LED

MeanSet1 = zeros(60,n);
MeanSet2 = zeros(60,n);
MeanSet3 = zeros(60,n);
i = 1;

disp('Beginning Calibration...')
Calibration = nScopeReadCh1Ch2Ch3(fs, fs*60, [1 1 1]);
Calibration1 = reshape(Calibration(:,1), [fs, 60]);
Calibration2 = reshape(Calibration(:,2), [fs, 60]);
Calibration3 = reshape(Calibration(:,3), [fs, 60]);
Calibration1 = Calibration1';
Calibration2 = Calibration2';
Calibration3 = Calibration3';
disp('Calibration Complete.')

disp('Initialize IR Signal')
disp('Press Any Key Once Completed.')
pause

for i = 1:1:n
    fprintf('Starting Minute %d Testing...\n', i)
    TempDataSet = nScopeReadCh1Ch2Ch3(fs, fs*60, [1 1 1]);
    Temp1 = reshape(TempDataSet(:,1), [fs, 60]);
    Temp2 = reshape(TempDataSet(:,2), [fs, 60]);
    Temp3 = reshape(TempDataSet(:,3), [fs, 60]);
    Temp1 = Temp1';
    Temp2 = Temp2';
    Temp3 = Temp3';
    
    DataSet1(:,:,i) = Temp1(:,:);
    DataSet2(:,:,i) = Temp2(:,:);
    DataSet3(:,:,i) = Temp3(:,:);
    
    MeanSet1(:,i) = squeeze(mean(DataSet1(:,:,i),2));
    MeanSet2(:,i) = squeeze(mean(DataSet2(:,:,i),2));
    MeanSet3(:,i) = squeeze(mean(DataSet3(:,:,i),2));

    fprintf('Completed Minute %d Testing.\n', i)
    save('CommunicationTesting_Case_Wet_030217_2.mat')  % Resaves collected data after every iteration
end

nScopeAPI('close');