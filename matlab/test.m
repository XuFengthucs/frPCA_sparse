clear;
load('Matrix.mat');
k=100;

tic;
[U2, S2, V2] = frPCA(A, k, 10);
Time_frPCA = toc;

tic;
[U, S, V] = svds(A, k);
Time_svds = toc;

semilogy(1:k, diag(S), '+-', 1:k, flipud(S2), 'x-');
axis([0, 101, 0.9*S(100, 100), 1.1*S(1,1)]);
ylabel('\sigma_i');
legend('svds', 'frPCA');
figure_FontSize=25; 
set(findobj('FontSize',10),'FontSize',25); 
set( get(gca,'XLabel'),'FontSize',figure_FontSize); 
set( get(gca,'YLabel'),'FontSize',figure_FontSize); 
set( get(gca,'XAxis'),'FontSize',figure_FontSize); 
set( get(gca,'YAxis'),'FontSize',figure_FontSize); 
set( get(gca,'XAxis'),'LineWidth',2); 
set( get(gca,'YAxis'),'LineWidth',2); 
set( get(gca,'Legend'),'FontSize',figure_FontSize); 
set(findobj( get(gca,'Children'),'LineWidth',0.5),'LineWidth',1);