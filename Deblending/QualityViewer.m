close all

% The iteration over random numbers was stopped after ran iterations
ran = 39;

%% Quality Factor 

fileID = 'Data/ParameterTest/quality.mat';
mydata = load(fileID);
Q = mydata.quality_matrix;

% figure(1); imagesc(squeeze( Q(:,2:2:end,48) ));

Q = Q(:,2:end,1:ran);
Q_avg = mean(Q,3);

% figure(2); imagesc(Q_avg);

figure(3); p1 = plot(Q_avg(1,:)); hold on; p2 = plot(Q_avg(2,:)); hold on; p3 = plot(Q_avg(3,:),'k'); %p4 = plot(Q(2,:)-Q(1,:));

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

figure(4); p1 = plot(squeeze( Q(1,:,10) )); hold on; p2 = plot(squeeze( Q(2,:,10) )); hold on; p3 = plot(squeeze( Q(3,:,10) ),'k'); %p4 = plot(Q(2,:)-Q(1,:));

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


%% Incoherency 

fileID = 'Data/ParameterTest/incoherency.mat';
mydata = load(fileID);
I = mydata.incoherency_matrix;

% figure(5); imagesc(squeeze( I(:,2:2:end,48) ));

I = I(:,2:end,1:ran);
I_avg = mean(I,3);

% figure(6); imagesc(I_avg);

figure(7); p1 = plot(I_avg(1,:)); hold on; p2 = plot(I_avg(2,:)); hold on; p3 = plot(I_avg(3,:),'k'); %p4 = plot(Q(2,:)-Q(1,:));

xlim([1,10]);
set(gca,'XTick',[2 4 6 8 10]);
set(gca,'XTickLabel',{'80','160','240','320','400'});
xlabel('Maximum firing time delay (ms)','fontweight','bold');

set(gca,'YTick',[0 0.25 0.5 0.75 1]);
%set(gca,'XTickLabel',{'20','40','60','80','100'});
ylabel('Incoherency','fontweight','bold');
set(gcf,'Position',[10 10 500 300]);

%set(gca,'FontSize',14);
%set(gca,'fontweight','bold');
myleg = legend([p3 p1 p2],'Random sources','Random time delays','Random time delays & random sources','Location','NorthWest');%,'xt Crossline - t');
set(myleg,'FontSize',10);

figure(8); p1 = plot(squeeze( I(1,:,10) )); hold on; p2 = plot(squeeze( I(2,:,10) )); hold on; p3 = plot(squeeze( I(3,:,10) ),'k'); %p4 = plot(Q(2,:)-Q(1,:));

xlim([1,10]);
set(gca,'XTick',[2 4 6 8 10]);
set(gca,'XTickLabel',{'80','160','240','320','400'});
xlabel('Maximum firing time delay (ms)','fontweight','bold');

set(gca,'YTick',[0 0.25 0.5 0.75 1]);
%set(gca,'XTickLabel',{'20','40','60','80','100'});
ylabel('Incoherency','fontweight','bold');
set(gcf,'Position',[10 10 500 300]);

%set(gca,'FontSize',14);
%set(gca,'fontweight','bold');
myleg = legend([p3 p1 p2],'Random sources','Random time delays','Random time delays & random sources','Location','NorthWest');%,'xt Crossline - t');
set(myleg,'FontSize',10);

%%

QvsI = [I_avg(1,:);Q_avg(1,:)];

figure(10); p1 = plot(I_avg(1,:),Q_avg(1,:)); hold on
p2 = plot(I_avg(2,:),Q_avg(2,:)); hold on
p3 = plot(I_avg(3,:),Q_avg(3,:),'k+');
myleg = legend([p3 p1 p2],'Random sources','Random time delays','Random time delays & random sources','Location','NorthWest');%,'xt Crossline - t');

