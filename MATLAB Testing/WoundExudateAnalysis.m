clear; clc; close all;
% files = {'WoundExudateTesting_Case_022817_1.mat',...
%          'WoundExudateTesting_Case_022817_2.mat',...
%          'WoundExudateTesting_Case_022817_3.mat',...
%          'WoundExudateTesting_Case_022817_4.mat',...
%          'WoundExudateTesting_Case_022817_5.mat'};

% files = {'WoundExudateTesting_Case_030217_1.mat',...
%          'WoundExudateTesting_Case_030217_2.mat',...
%          'WoundExudateTesting_Case_030217_3.mat'};

% files = {'WoundExudateTesting_None_022817_1.mat',...
%          'WoundExudateTesting_None_022817_2.mat',...
%          'WoundExudateTesting_None_022817_3.mat',...
%          'WoundExudateTesting_None_022817_4.mat',...
%          'WoundExudateTesting_None_022817_5.mat'};

% files = {'Water_Light2Gamgee_04062017_1.mat',...
%          'Water_Light2Gamgee_04062017_2.mat',...
%          'Water_Light2Gamgee_04062017_3.mat',...
%          'Water_Light2Gamgee_04062017_4.mat',...
%          'Water_Light2Gamgee_04062017_5.mat',...
%          'Water_Light2Gamgee_04062017_6.mat'};
     
% files = {'Water_15hours_05152017.mat'};

% files = {'Water_Saturation_04272017_2.mat',...
%          'Water_Saturation_04272017_3.mat',...
%          'Water_Saturation_04272017_4.mat',...    
%          'Water_Saturation_04272017_5.mat'};

% files = {'Water_NoSponge_04272017_1.mat'};

%files = {'Water_Light2Gamgee_04062017_5.mat'};'

% files = {'Baseline_Light2Gamgee_04062017_1.mat',...
%          'Baseline_Light2Gamgee_04062017_2.mat'};

% files = {'Baseline_NoLight2Gamgee_04062017_1.mat',...
%          'Baseline_NoLight4Gamgee_04062017_1.mat'};

% files = {'Baseline_NoLight_04062017_1.mat',...
%          'Baseline_NoLight_04062017_2.mat'};

% files = {'Baseline_NoLightCase_04062017_1.mat',...
%          'Baseline_NoLightCase_04062017_2.mat',...
%          'Baseline_NoLightCase_04062017_3.mat'};

N = length(files);
% Init = zeros(1,N);
% Peak = zeros(1,N);
% Plat = zeros(1,N);

% plot_init = [];
% plot_plat = [];

hold on
for ii = 1:N
    load(files{ii});
    data1 = squeeze(MeanSet1);
%     data2 = squeeze(MeanSet2);
%     data3 = squeeze(MeanSet3);
%     data4 = squeeze(MeanSet4);
    
    n1 = size(data1,1);
    n2 = size(data1,2);
    
%     nn1 = size(data2,1);
%     nn2 = size(data2,2);
%     
%     nnn1 = size(data1,1);
%     nnn2 = size(data1,2);
%     
%     nnnn1 = size(data1,1);
%     nnnn2 = size(data1,2);
    
    tempdata1 = reshape(data1, [n1*n2, 1]);
%     tempdata2 = reshape(data2, [nn1*nn2, 1]);
%     tempdata3 = reshape(data3, [nnn1*nnn2, 1]);
%     tempdata4 = reshape(data4, [nnnn1*nnnn2, 1]);

    figure(1)
    hold on
    p1 = plot(tempdata1)
%     p2 = plot(tempdata2)
%     p3 = plot(tempdata3)
%     p4 = plot(tempdata4)
    hold off
%     Init(ii) = Data(1,1);
%     Peak(ii) = min(Data);
%     
%     ind_peak = find(Data == Peak(ii));
%     ind_plat = find(diff(Data) == min(abs((diff(Data)))));
%     ind_plat = ind_plat(ind_plat > ind_peak);
%     ind_plat = ind_plat(1);
%     Plat(ii) = Data(ind_plat,1);

%     Init(ii) = mean(data(:,1));
%     Plat(ii) = mean(data(:,end));
    
%     plot_init = [plot_init; 1 data(1)];
%     plot_plat = [plot_plat; length(tempdata) data(end)];
end

% p1 = plot(plot_init(:,1), plot_init(:,2), 'gd', 'MarkerSize', 10, 'LineWidth', 1.5);
% p2 = plot(plot_plat(:,1), plot_plat(:,2), 'rd', 'MarkerSize', 10, 'LineWidth', 1.5);

title('IR Voltage Resposne | 2 Gamgee Layers | No Case')
xlabel('Time [sec]')
ylabel('Voltage [V]')
%legend([p1 p2 p3 p4], 'Adjacent Sensor', 'Sensor 2mm away', 'Sensor 4mm away', 'Sensor 6mm away')
% legend([p1 p2], 'Initial Voltage', 'Plateau Voltage')

% Voltage.Initial = Init;
% Voltage.Plateau = Plat;

% save('CaseStats2.mat', 'Voltage')