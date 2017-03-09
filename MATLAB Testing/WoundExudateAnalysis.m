clear; clc; close all;
files = {'WoundExudateTesting_Case_022817_1.mat',...
         'WoundExudateTesting_Case_022817_2.mat',...
         'WoundExudateTesting_Case_022817_3.mat',...
         'WoundExudateTesting_Case_022817_4.mat',...
         'WoundExudateTesting_Case_022817_5.mat'};

% files = {'WoundExudateTesting_Case_030217_1.mat',...
%          'WoundExudateTesting_Case_030217_2.mat',...
%          'WoundExudateTesting_Case_030217_3.mat',...
%          'WoundExudateTesting_Case_030217_1_2.mat'};

N = length(files);
Init = zeros(1,N);
Peak = zeros(1,N);
Plat = zeros(1,N);

plot_init = [];
plot_plat = [];

hold on
for ii = 1:N
    load(files{ii});
    data = squeeze(MeanSet1);
    n1 = size(data,1);
    n2 = size(data,2);
    tempdata = reshape(data, [n1*n2, 1]);

    figure(1)
    plot(tempdata)
%     Init(ii) = Data(1,1);
%     Peak(ii) = min(Data);
%     
%     ind_peak = find(Data == Peak(ii));
%     ind_plat = find(diff(Data) == min(abs((diff(Data)))));
%     ind_plat = ind_plat(ind_plat > ind_peak);
%     ind_plat = ind_plat(1);
%     Plat(ii) = Data(ind_plat,1);



    Init(ii) = mean(data(:,1));
    Plat(ii) = mean(data(:,end));
    
    plot_init = [plot_init; 1 data(1)];
    plot_plat = [plot_plat; length(tempdata) data(end)];
end

p1 = plot(plot_init(:,1), plot_init(:,2), 'gd', 'MarkerSize', 10, 'LineWidth', 1.5);
p2 = plot(plot_plat(:,1), plot_plat(:,2), 'rd', 'MarkerSize', 10, 'LineWidth', 1.5);

hold off

title('IR Voltage Resposne | 4 gamgee layers | Case')
xlabel('Time [sec]')
ylabel('Voltage [V]')
legend([p1 p2], 'Initial Voltage', 'Plateau Voltage')

Voltage.Initial = Init;
Voltage.Plateau = Plat;

save('CaseStats2.mat', 'Voltage')