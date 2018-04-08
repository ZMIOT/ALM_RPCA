clear all;
close all;

%affine2d
%initialize_config�������config.scale���ڷ����С
%

path = '.\2Ddata\original\';
%%%%%%%%%%%%%%��ʵ����%%%%%%%%%%%%%%%%%%
%  MDataSource = imread([path, 'bone-3.gif']);
%  DDataSource = imread([path, 'bone-18.gif']);
%  MDataSource = imread([path, 'heart-6.gif']);
%  DDataSource = imread([path, 'heart-18.gif']);  %config.scale / 20
 MDataSource = imread([path, 'apple-17.gif']);
 DDataSource = imread([path, 'apple-18.gif']);
%  MDataSource = imread([path, 'device6-9.gif']);
%  DDataSource = imread([path, 'device6-11.gif']);
%  MDataSource = imread([path, 'pocket-15.gif']);
%  DDataSource = imread([path, 'pocket-16.gif']);
MDataSource = edge(MDataSource,'sobel');%һ����ά�������б�Ե��Ϊ1��������Ϊ��
[X, Y] = find(MDataSource==1);%X Y �ֱ�Ϊ��Ե��ĺ�������
MData = [X Y];
DDataSource = edge(DDataSource,'sobel');
[X, Y] = find(DDataSource==1);
DData = [X Y];
model = MData; scene = DData;

% model = textread('fish_X.txt');  % config.scale /5 = 0.073
% scene = textread('fish_Y.txt');
% model = textread('face_X.txt');
% scene = textread('face_Y.txt');
% model = textread('fish_X_nohead.txt');
% scene = textread('fish_Y_notail.txt');


config = initialize_config(model, scene, 'affine2d');

[param, transformed_model, history, config] = gmmreg_L2(config);

figure(1)
DisplayPoints2D(config.model,config.scene);
figure(2)
DisplayPoints2D(transformed_model,config.scene);

figure
plot(config.scene(:,1),config.scene(:,2),'r.') %DData�ǲ�����һ����������ԭͼһ��
hold on;
plot(transformed_model(:,1),transformed_model(:,2),'b.') %��ת���ͼ
