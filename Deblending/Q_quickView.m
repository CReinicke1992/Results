close all

fileID = 'Data/ParameterTest/quality.mat';
mydata = load(fileID);
Q = mydata.quality_matrix;
figure; p1 = plot(Q(1,:)); hold on; p2 = plot(Q(2,:)); hold on; p3 = plot(Q(3,:),'k'); hold on; %p4 = plot(Q(2,:)-Q(1,:));

xlim([2,20]);
set(gca,'XTick',[4 8 12 16 20]);
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