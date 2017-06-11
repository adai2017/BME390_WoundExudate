nScopeAPI('open',1);
%n = 900;         % Number of minutes want to run
%interval = 1;   % How long between intervals in minutes
fs = 5;         % Sampling Rate

DataSet1 = [];
% DataSet2 = [];
% DataSet3 = [];
% DataSet4 = [];

MeanSet1 = [];
% MeanSet2 = [];
% MeanSet3 = [];
% MeanSet4 = [];

for i = 1:1:n
    fprintf('Starting Minute %d Testing...\n', i)
%     Temp = nScopeReadCh1Ch2(fs, fs*60, [1, 1]);
    Temp = nScopeReadAllChannels(fs, fs*60, [1, 1, 1, 1]);
    
    TempData1 = Temp(:,1);
    TempData1 = reshape(TempData1, [fs, 60]);
    TempData1 = TempData1';
    DataSet1(:,:,i) = TempData1(:,:);
    MeanSet1(:,:,i) = mean(DataSet1(:,:,i),2);
    
%     TempData2 = Temp(:,2);
%     TempData2 = reshape(TempData2, [fs, 60]);
%     TempData2 = TempData2';
%     DataSet2(:,:,i) = TempData2(:,:);
%     MeanSet2(:,:,i) = mean(DataSet2(:,:,i),2);
%     
%     TempData3 = Temp(:,3);
%     TempData3 = reshape(TempData3, [fs, 60]);
%     TempData3 = TempData3';
%     DataSet3(:,:,i) = TempData3(:,:);
%     MeanSet3(:,:,i) = mean(DataSet3(:,:,i),2);
%     
%     TempData4 = Temp(:,4);
%     TempData4 = reshape(TempData4, [fs, 60]);
%     TempData4 = TempData4';
%     DataSet4(:,:,i) = TempData4(:,:);
%     MeanSet4(:,:,i) = mean(DataSet4(:,:,i),2);

    fprintf('Completed Minute %d Testing.\n', i)
%     save('Water_15hours_05152017.mat')  % Resaves collected data after every iteration
    
%     if ~isempty(warnmsg)
%         [warnmsg, msgid] = lastwarn;
%     end
end

nScopeAPI('close');