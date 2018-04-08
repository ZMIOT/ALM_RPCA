clc;
clear;
close all;
%�ֶ�������ֵ����������ɫ�㼯��ȡ�����ߵ�3���㣬�������ں�ɫ�㼯�а�˳��ȡ���Ӧ��3���㡣
path = '.\2Ddata\original\';
%���̣�MData(��ɫ��->TData==DData(��ɫ����MData���任��DDataƥ�䣩

%%%%%%%%%%%%%%%��ʵ����%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  MDataSource = imread([path, 'bone-3.gif']);
%  DDataSource = imread([path, 'bone-18.gif']);
%   MDataSource = imread([path, 'heart-6.gif']);
%  DDataSource = imread([path, 'heart-18.gif']);
 MDataSource = imread([path, 'apple-17.gif']);
 DDataSource = imread([path, 'apple-18.gif']);
%  MDataSource = imread([path, 'device6-9.gif']);
%  DDataSource = imread([path, 'device6-11.gif']);
% MDataSource = imread([path, 'pocket-15.gif']);
%  DDataSource = imread([path, 'pocket-16.gif']);
%%%%%%%%%%%%%%%%%%%%%%% ����Ԥ���� %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MDataSource = rgb2gray(MDataSource);
% DDataSource = rgb2gray(DDataSource);
MDataSource1 = MDataSource;
DDataSource1 = DDataSource;
MDataSource = edge(MDataSource,'sobel');%һ����ά�������б�Ե��Ϊ1��������Ϊ��
[X, Y] = find(MDataSource==1);%X Y �ֱ�Ϊ��Ե��ĺ�������
MData = [X Y];
% A0=[0.865 0.23;-0.8 0.25]
% MData=MData*A0';%%%�������任
% MData = vertcat(MData(1:2,:),MData(2:500,:));
DDataSource = edge(DDataSource,'sobel');
[X, Y] = find(DDataSource==1);
DData = [X Y];

% 
%  DData = vertcat(DData(1:2,:),DData(2:500,:));
%  %%����
% A0=[0.865 0.5;-0.5 0.865]
% t0=[0;0];
% DData=MData*A0';
% DData = [DData(:,1)+t0(1), DData(:, 2)+t0(2)];
 
%DData = vertcat(DData(1:100,:),DData(250:400,:),DData(550:1800,:),DData(1908:end,:));
%%%%������Ե��״
figure
plot(X,Y,'r.');
plot(DData(:,1),DData(:,2),'r.')
hold on
plot(MData(:,1),MData(:,2),'b.')
axis equal;
grid on

%%%%%%��ginput��ó�ֵ%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
A0=AC0(1:2,1:2)
t0=AC0(1:2,3)


tri = delaunayn(DData);
 
%��ӵģ���
% [M, D] = size(MData); 
% R = eye(D);
% t = zeros(D,1)
%%%%%%%%%%%%%%%%%%%%%%%% ICP %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[R1, t1, TCorr1, MSE1, TData1] = AffineICP2D(MData, DData,A0,t0, tri);
figure
 %plot(DData(:,1),DData(:,2),'ko')
hold on
plot(DData(:,1),DData(:,2),'r.') %DData�ǲ�����һ����������ԭͼһ��
plot(TData1(:,1),TData1(:,2),'b.') %��ת���ͼ

%plot(TData1(TCorr1(:,2),1),TData1(TCorr1(:,2),2),'g.')%��ת���ͼ
axis equal;
% axis off
grid on
