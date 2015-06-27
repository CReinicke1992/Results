close all

fileID = 'Data/ParameterTest/quality.mat';
mydata = load(fileID);
Q = mydata.quality_matrix;

figure; p1 = plot(Q(1,2:2:end)); hold on; p2 = plot(Q(2,2:2:end)); hold on; p3 = plot(Q(3,2:2:end),'k'); %p4 = plot(Q(2,:)-Q(1,:));

xlim([1,10]);
set(gca,'XTick',[2 4 6 8 10]);
set(gca,'XTickLabel',{'80','160','240','320','400'});
xlabel('Maximum firing time delay (ms)','fontweight','bold');

set(gca,'YTick',[0 2 4 6 8]);
%set(gca,'XTickLabel',{'20','40','60','80','100'});
ylabel('Quality factor (dB)','fontweight','bold');
set(gcf,'Position',[10 10 500 300]);

%set(gca,'FontSize',14);
%set(gca,'fontweight','bold');
myleg = legend([p3 p1 p2],'Random sources','Random time delays','Random time delays & random sources','Location','NorthWest');%,'xt Crossline - t');
set(myleg,'FontSize',10);
savefig('Plots/ParameterTest/quality_line_plot');

%% Plot incoherency

fileID = 'Data/ParameterTest/incoherency.mat';
mydata = load(fileID);
in = mydata.incoherency_matrix;

figure; p1 = plot(in(1,2:2:end)); hold on; p2 = plot(in(2,2:2:end)); hold on; p3 = plot(in(3,2:2:end),'k'); hold on; %p4 = plot(Q(2,:)-Q(1,:));
ylim([0.97,1]);
xlim([1,10]);
set(gca,'XTick',[2 4 6 8 10]);
set(gca,'XTickLabel',{'80','160','240','320','400'});
xlabel('Maximum firing time delay (ms)','fontweight','bold');

ylabel('Incoherency','fontweight','bold');
set(gcf,'Position',[10 10 500 300]);

%set(gca,'FontSize',14);
%set(gca,'fontweight','bold');
myleg = legend([p3 p1 p2],'Random sources','Random time delays','Random time delays & random sources','Location','SouthEast');%,'xt Crossline - t');
set(myleg,'FontSize',10);
savefig('Plots/ParameterTest/incoherency_line_plot');
