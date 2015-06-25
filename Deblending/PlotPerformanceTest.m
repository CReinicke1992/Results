%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PURPOSE
% * Plot the data which was created in PerformanceTest.m
% * Save the plots in a folder structure:
%       Plots/BlendingPattern/ShootingWindow/

% OVERVIEW
% 1 Load and set general parameters
% 2 Iterate over patterns and shooting windows to create all the plots
%       -> Which data? Blended data, pseudo-deblended data, deblended data, 
%          misfit, blending matrix
%       -> Read data from Data/BlendingPattern/ShootingWindow/
%       -> Create plot
%       -> Save plot to Plots/BlendingPattern/ShootingWindow/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 1 Load and set general parameters

% Load the paramteres which belong to the loaded data, in this case it is
% the reduced data
fileID = '../Parameters_red.mat';
Parameters_red = load(fileID); clear fileID

dt   = Parameters_red.dt;       % Duration of a time sample
dx  = Parameters_red.dx;        % Number of crossline sources
di  = Parameters_red.di;        % Number of inline sources
Ns   = Parameters_red.Ns;       % Number of sources
Nsx   = Parameters_red.Nsx;     % Number of crossline sources
Nsi   = Parameters_red.Nsi;     % Number of inline sources
b    = 7;                       % Blending factor for a 49 x 49 source grid
clear Parameters_red

%% 2 Iterate over patterns and shooting windows to create all the plots

for pattern = 1:3
    
    % Choose a folder based on the pattern
    if pattern == 1
        folder = '3Time';
    elseif pattern == 2
        folder = '5Space-Time-Crossline';
    elseif pattern == 3
        folder = '2Space-Crossline';
    end
    
    % Set path to the subfolder
    parent_data = strcat('Data/',folder,'/');
    parent_plot = strcat('Plots/',folder,'/');
    
     for t_g = 100:-5:10
         
         % As tg is supposed to be an even number, I inserted this stupid
         % modification
         if mod(t_g,2) ~= 0;
             t_g = t_g+1;
         end
         
         % Create pathes to the data and to the location where the plot
         % should be saved
         subfolder = sprintf('tg%d/',t_g);
         path_data = strcat(parent_data,subfolder);
         path_plot = strcat(parent_plot,subfolder);
         
         %% Blended Data
         
         % Load data
         fileID = strcat(path_data,'Blended.mat');
         Data = load(fileID);
         data_bl = Data.data_bl; clear fileID Data
         
         % Make and save plot
         figure; imagesc( squeeze( data_bl(:,1,:) ) ); colormap gray
         xlabel('Experiment Number','fontweight','bold');
         ylab = sprintf('Time (%.2f ms / sample)',dt*1000);
         ylabel(ylab,'fontweight','bold');
         set(gca,'FontSize',14);
         tit = sprintf('Blended, b = %d, tg = %.2f ms,\n Pattern: %s, Wavelet = 60 ms.',b,t_g*dt*1000,folder);
         title(tit);
         savefig( strcat(path_plot,'Blended') ); 
         close; clear data_bl tit ylab
         
         %% Pseudo-Deblended Data
         
         % Load data
         fileID = strcat(path_data,'Pseudo-Deblended.mat');
         Data = load(fileID);
         data_ps = Data.data_ps; clear fileID Data
         
         % Make and save plot
         figure; imagesc( squeeze( data_ps(:,1,:) ) ); colormap gray
         xlab = sprintf('Source Number (Xline / Inline spacing = %.2fm / %.2fm)',dx,di);
         xlabel(xlab,'fontweight','bold');
         ylab = sprintf('Time (%.2f ms / sample)',dt*1000);
         ylabel(ylab,'fontweight','bold');
         set(gca,'FontSize',14);
         tit = sprintf('Pseudo-Deblended, b = %d,\n tg = %.2f ms, Pattern: %s, Wavelet = 60 ms.',b,t_g*dt*1000,folder);
         title(tit);
         savefig( strcat(path_plot,'Pseudo-Deblended') ); 
         close; clear data_ps tit xlab ylab
         
         %% Deblended Data
         
         % Load data
         fileID = strcat(path_data,'Deblended.mat');
         Data = load(fileID);
         debl = Data.debl; clear fileID Data
         
         % Load data
         fileID = strcat(path_data,'QualityFactor.mat');
         Data = load(fileID);
         Q = Data.Q; clear fileID Data
         
         % Make and save plot
         figure; imagesc( squeeze( debl(:,1,:) ) ); colormap gray
         xlab = sprintf('Source Number (Xline / Inline spacing = %.2fm / %.2fm)',dx,di);
         xlabel(xlab,'fontweight','bold');
         ylab = sprintf('Time (%.2f ms / sample)',dt*1000);
         ylabel(ylab,'fontweight','bold');
         set(gca,'FontSize',14);
         tit = sprintf('Deblended (Q = %.2f), b = %d,\n tg = %.2f ms, Pattern: %s, Wavelet = 60 ms.',Q,b,t_g*dt*1000,folder);
         title(tit);
         savefig( strcat(path_plot,'Deblended') ); 
         close; clear debl Q tit xlab ylab
         
         %% Misfit
         
         % Load data
         fileID = strcat(path_data,'Misfit_data-debl.mat');
         Data = load(fileID);
         misfit = Data.misfit; clear fileID Data
         
         % Load data
         fileID = strcat(path_data,'QualityFactor.mat');
         Data = load(fileID);
         Q = Data.Q; clear fileID Data
         
         % Make and save plot
         figure; imagesc( squeeze( misfit(:,1,:) ) ); colormap gray
         xlab = sprintf('Source Number (Xline / Inline spacing = %.2fm / %.2fm)',dx,di);
         xlabel(xlab,'fontweight','bold');
         ylab = sprintf('Time (%.2f ms / sample)',dt*1000);
         ylabel(ylab,'fontweight','bold');
         set(gca,'FontSize',14);
         tit = sprintf('Misfit (data -deblended, Q = %.2f), b = %d,\n tg = %.2f ms, Pattern: %s, Wavelet = 60 ms.',Q,b,t_g*dt*1000,folder);
         title(tit);
         savefig( strcat(path_plot,'Misfit_data-debl') ); 
         close; clear misfit Q tit xlab ylab
         
         %% Blending matrix
         
         % Load data
         fileID = strcat(path_data,'blending_matrix.mat');
         Data = load(fileID);
         g = Data.g; clear fileID Data
         
         % Make and save plot
         figure; imagesc( g );
         xlab = sprintf('Experiment Number (b = %d)',b);
         xlabel(xlab,'fontweight','bold');
         ylab = sprintf('Source number (Nsx, Nsi) = (%d, %d)',Nsx,Nsi);
         ylabel(ylab,'fontweight','bold');
         set(gca,'FontSize',14);
         tit = sprintf('Blending matrix, b = %d,\n tg = %.2f ms, Pattern: %s, Wavelet = 60 ms.',b,t_g*dt*1000,folder);
         title(tit);
         savefig( strcat(path_plot,'blending_matrix') ); 
         close; clear g tit xlab ylab
         
     end
end
