clc;
clear;
close all;
%%%%%%A*MData->DData�Ҷ�Ӧ��
%seta = 2;
%�ֶ�������ֵ����������ɫ�㼯��ȡ�����ߵ�3���㣬�������ں�ɫ�㼯�а�˳��ȡ���Ӧ��3���㡣

path = '..\2Ddata\original\';

% ��1��û�����ŵ�����
% MDataSource = imread([path, 'bat-4.gif']);
% DDataSource = imread([path, 'bat-5.gif']);
% MDataSource = imread([path, 'beetle-6.gif']);
% DDataSource = imread([path, 'beetle-5.gif']);
% MDataSource = imread([path, 'horse-4.gif']);
% DDataSource = imread([path, 'horse-3.gif']);


% ��2��û�����ŵ�����
%  MDataSource = imread([path, 'butterfly-18.gif']);
%  DDataSource = imread([path, 'butterfly-19.gif']);
% MDataSource = imread([path, 'horse-2.gif']);
% DDataSource = imread([path, 'horse-1.gif']);
%MDataSource = imread('C:\Users\hongchen chen\Pictures\original\horse-2.gif');
% DDataSource = imread( 'C:\Users\hongchen chen\Pictures\original\horse-1.gif');

% 
% MDataSource = imread([path, 'deer-9.gif']);
% DDataSource = imread([path, 'deer-8.gif']);
% % 
% MDataSource = imread([path, 'apple-19.gif']);
% DDataSource = imread([path, 'apple-18.gif']);
% 
%��������ת����
% MDataSource = imread([path, 'bird-11.gif']);
% DDataSource = imread([path, 'bird-14.gif']);
% MDataSource = imread([path, 'butterfly-1.gif']);
% DDataSource = imread([path, 'butterfly-2.gif']);
% MDataSource = imread([path, 'chicken-2.gif']);
% DDataSource = imread([path, 'chicken-3.gif']);



%%%%%%%%%%%%%%%%%%%%%%%%%��������%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MDataSource = imread([path, 'dog-1.gif']);
% DDataSource = imread([path, 'dog-19.gif']);
% MDataSource = imread([path, 'fish-15.gif']);
% DDataSource = imread([path, 'fish-14.gif']);
% MDataSource = imread([path, 'chicken-16.gif']);
% DDataSource = imread([path, 'chicken-2.gif']);
% MDataSource = imread([path, 'bird-5.gif']);
% DDataSource = imread([path, 'bird-4.gif']);
% MDataSource = imread([path, 'apple-1.gif']);
% DDataSource = imread([path, 'apple-2.gif']);


% ��1�������ŵ�����
% MDataSource = imread([path, 'flatfish-14.gif']);
% DDataSource = imread([path, 'flatfish-13.gif']);
% ��2�������ŵ�����
% MDataSource = imread([path, 'elephant-17.gif']);
% DDataSource = imread([path, 'elephant-19.gif']);
% MDataSource = imread([path, 'apple-4.gif']);
% DDataSource = imread([path, 'apple-3.gif']);
% MDataSource = imread([path, 'bell-19.gif']);
% DDataSource = imread([path, 'bell-20.gif']);
% MDataSource = imread([path, 'horseshoe-8.gif']);
% DDataSource = imread([path, 'horseshoe-16.gif']);
% MDataSource = imread([path, 'turtle-1.gif']);
% DDataSource = imread([path, 'turtle-6.gif']);

% ��1��û�����ŵ�����
% MDataSource = imread([path, 'bat-4.gif']);
% DDataSource = imread([path, 'bat-5.gif']);
% MDataSource = imread([path, 'beetle-6.gif']);
% DDataSource = imread([path, 'beetle-5.gif']);
% MDataSource = imread([path, 'horse-3.gif']);
% DDataSource = imread([path, 'horse-4.gif']);

% ��2��û�����ŵ�����
% MDataSource = imread([path, 'butterfly-18.gif']);
% DDataSource = imread([path, 'butterfly-19.gif']);
% MDataSource = imread([path, 'horse-2.gif']);
% DDataSource = imread([path, 'horse-1.gif']);
% MDataSource = imread([path, 'horse-8.gif']);
% DDataSource = imread([path, 'horse-7.gif']);

% MDataSource = imread([path, 'ray-5.gif']);
% DDataSource = imread([path, 'ray-8.gif']);

% MDataSource = imread([path, 'heart-3.gif']);
% DDataSource = imread([path, 'heart-14.gif']);

%  MDataSource = imread([path, 'ray-17.gif']);
%  DDataSource = imread([path, 'ray-18.gif']);

%%%%%%%%%%%%%%%%%%%%%%%%%%�ҵķ�������%%%%%%%%%%%%%
%  MDataSource = imread([path, 'bat-2.gif']);
%  DDataSource = imread([path, 'bat-3.gif']);
%  MDataSource = imread([path, 'bird-7.gif']);
%  DDataSource = imread([path, 'bird-8.gif']);
%   MDataSource = imread([path, 'chicken-2.gif']);%sigma=1.5
%   DDataSource = imread([path, 'chicken-3.gif']);
%  MDataSource = imread([path, 'apple-17.gif']);
%  DDataSource = imread([path, 'apple-18.gif']);
%  MDataSource = imread([path, 'butterfly-5.gif']);
%  DDataSource = imread([path, 'butterfly-6.gif']);
%   MDataSource = imread([path, 'crown-4.gif']);
%   DDataSource = imread([path, 'crown-5.gif']);
%  MDataSource = imread([path, 'cup-18.gif']);
%  DDataSource = imread([path, 'cup-20.gif']);


%%%%%%%%%%%%%%��ʵ����%%%%%%%%%%%%%%%%%%
 MDataSource = imread([path, 'bone-3.gif']);
 DDataSource = imread([path, 'bone-18.gif']);
%  MDataSource = imread([path, 'pocket-15.gif']);
%  DDataSource = imread([path, 'pocket-16.gif']);
%  MDataSource = imread([path, 'heart-6.gif']);
%  DDataSource = imread([path, 'heart-18.gif']);
%  MDataSource = imread([path, 'apple-17.gif']);
%  DDataSource = imread([path, 'apple-18.gif']);
%  MDataSource = imread([path, 'device6-9.gif']);
%  DDataSource = imread([path, 'device6-11.gif']);
%%%%%%%%%%%%%%%%%%%%%%% ����Ԥ���� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MDataSource = rgb2gray(MDataSource);
% DDataSource = rgb2gray(DDataSource);

% MDataSource1 = MDataSource;
% DDataSource1 = DDataSource;

MDataSource = edge(MDataSource,'sobel');%һ����ά�������б�Ե��Ϊ1��������Ϊ��
[X, Y] = find(MDataSource==1);%X Y �ֱ�Ϊ��Ե��ĺ�������
MData = [X Y];
% A0=[0.865 0.23;-0.8 0.25]
% MData=MData*A0';%%%�������任
%MData = vertcat(MData(1:2,:),MData(2:500,:));
Num= length(MData);
% Num = length(Y);
One = ones(Num,1);
MData1=[MData One];
% MData1 = [X Y One];

%�����A0
% A0=rand(2,2);
% t0=rand(2,1);
% A=[A0,t0]
% A0=[0.865 0.5;-0.5 0.865]
% t0=[0;0];
% DData=MData*A0';
% DData = [DData(:,1)+t0(1), DData(:, 2)+t0(2)];
% DData1 =  [DData One];

DDataSource = edge(DDataSource,'sobel');
[X, Y] = find(DDataSource==1);
DData = [X Y];

%DData = vertcat(DData(1:50,:),DData(100:400,:),DData(550:800,:),DData(1000:end,:));
%DData = vertcat(DData(1:2,:),DData(2:500,:));

Num = length(Y);
One = ones(Num,1);
DData1 = [X Y One];
%DData1 = vertcat(DData1(1:50,:),DData1(100:400,:),DData1(550:800,:),DData1(1000:end,:));
%DData1 = vertcat(DData1(1:2,:),DData1(2:500,:));




%%%%������Ե��״
figure
plot(X,Y,'r.');
plot(DData(:,1),DData(:,2),'r.')
hold on
plot(MData(:,1),MData(:,2),'b.')
axis equal;
grid on


%%%%%%��ginput��ó�ֵ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[x y]=ginput(3);  %%MData ��ɫ
for i=1:3
    min=(MData(1,1)-x(i))^2+(MData(1,2)-y(i))^2 ;
    xtmp=MData(1,1);
    ytmp=MData(1,2);
    for j=1:length(MData)
        if ((MData(j,1)-x(i))^2+(MData(j,2)-y(i))^2)<min
             min=(MData(j,1)-x(i))^2+(MData(j,2)-y(i))^2;
             xtmp=MData(j,1);
             ytmp=MData(j,2);
        end    
    end
    x(i)=xtmp;
    y(i)=ytmp;
end
[x1 y1]=ginput(3);  %%DData ��ɫ
for i=1:3
    min=(DData(1,1)-x1(i))^2+(DData(1,2)-y1(i))^2 ;
    xtmp=DData(1,1);
    ytmp=DData(1,2);
    for j=1:length(DData)
        if ((DData(j,1)-x1(i))^2+(DData(j,2)-y1(i))^2)<min
             min=(DData(j,1)-x1(i))^2+(DData(j,2)-y1(i))^2;
             xtmp=DData(j,1);
             ytmp=DData(j,2);
        end    
    end
    x1(i)=xtmp;
    y1(i)=ytmp;
end

%%%%�����ֵA0��t0%%%%%%%%%%
unit=ones(3,1);
M=[x y unit]
value1=M\x1;
value2=M\y1;
p=[0;0;1];
AC0=[value1 value2 p]'
% A0=A(1:2,1:2)
% t0=A(1:2,3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(X,Y,'r.');
plot(DData(:,1),DData(:,2),'r.')
axis off
figure
plot(MData(:,1),MData(:,2),'b.')
axis off

tri = delaunayn(DData);

%��ӵģ���
% [M, D] = size(MData); 
% R = eye(D);
% t = zeros(D,1)
%%%%%%%%%%%%%%%%%%%%%%%% ICP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[A, TCorr1, error, TData] = ICP(MData, DData, tri,AC0);
% save data1.txt  error  -ascii -double
% xlswrite(error_device, error)
% figure;
% plot(error(1:50), 'r*-');
% hold on
% plot(error1(1:50), 'bo-');
% plot(error2(1:50), 'gx-');
% grid on;
% xlabel('Iteration number');
% ylabel('RMS');
% title('Compare ICP, ICPS and ICPBS (0.9��s��1.1)');
% legend('ICP',  'ICPBS', 'ICPUS', 1);
% axis([0 50 0.0015 0.006])



figure
 %plot(DData(:,1),DData(:,2),'ko')
hold on
plot(DData(:,1),DData(:,2),'r.') %DData�ǲ�����һ����������ԭͼһ��
plot(TData(:,1),TData(:,2),'b.') %��ת���ͼ
%plot(TData1(TCorr1(:,2),1),TData1(TCorr1(:,2),2),'g.')%��ת���ͼ
axis equal;
axis off;
grid on
