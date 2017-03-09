clear; clc; close all;
files = {'CommunicationTesting_None_030217_1.mat',...
         'CommunicationTesting_Case_030217_1.mat'};
     
n = length(files);
num = 0;

for ii = 1:n
    load(files{ii})
    ind = size(DataSet1, 3);
    
    cal1 = reshape(Calibration(:,1), [fs, 60]);
    cal2 = reshape(Calibration(:,2), [fs, 60]);
    cal3 = reshape(Calibration(:,3), [fs, 60]);
    cal1 = cal1';
    cal2 = cal2';
    cal3 = cal3';
    
    for j = 1:ind
        tempdat1 = DataSet1(:,:,j) - cal1;
        tempdat2 = DataSet2(:,:,j) - cal2;
        tempdat3 = DataSet3(:,:,j) - cal3;
        
        data1(:,j) = mean(tempdat1,2);
        data2(:,j) = mean(tempdat2,2);
        data3(:,j) = mean(tempdat3,2);
    end
    figure(1 + num*2)
    hold on
    p11 = plot(50*data1(:,2));
    p12 = plot(50*data2(:,2));
    p13 = plot(data3(:,2));
    hold off
    legend('Sensor - Top', 'Sensor - Bottom', 'IR LED')
    if ii == 1
        title('No Case - First Trial')
    else
        title('Case - First Trial')
    end
    xlabel('Time [sec]')
    ylabel('Voltage [V]')
    
    figure(2 + num*2)
    hold on
    p21 = plot(50*data1(:,end));
    p22 = plot(50*data2(:,end));
    p23 = plot(data3(:,end));
    hold off
    legend('Sensor - Top', 'Sensor - Bottom', 'IR LED')
    if ii == 1
        title('No Case - Final Trial')
    else
        title('Case - Final Trial')
    end
    xlabel('Time [sec]')
    ylabel('Voltage [V]')
    
    num = num + 1;
end